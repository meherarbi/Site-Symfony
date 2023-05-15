<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\RecentlyViewedProduct;
use App\Entity\SearchProduct;
use App\Form\SearchProductsType;
use App\Repository\ProductRepository;
use App\Repository\RecentlyViewedProductRepository;
use App\Service\ElasticsearchService;
use App\Service\SizeSorter;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query;
use Knp\Component\Pager\PaginatorInterface;
use Psr\Log\LoggerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;
    private $elasticsearchService;

    private $logger;

    public function __construct(EntityManagerInterface $entityManager, ElasticsearchService $elasticsearchService, LoggerInterface $logger)
    {
        $this->entityManager = $entityManager;
        $this->elasticsearchService = $elasticsearchService;
        $this->logger = $logger;
    }
/**
 * @Route("/product", name="products")
 */
public function index(PaginatorInterface $paginator, Request $request, ProductRepository $productrepository)
{
    $user = $this->getUser();

    $search = new SearchProduct();
    $form = $this->createForm(SearchProductsType::class, $search);
    $form->handleRequest($request);

    // get the page number from the query string
    $page = $request->query->getInt('page', 1);
    
    $products = $paginator->paginate(
        $productrepository->findWithSearchNoCategory($search),
        $page,
        9 /*limit per page*/
        
    );

    if ($form->isSubmitted() && !$form->isValid()) {
        // gestion des erreurs
        $errors = $form->getErrors(true);
        foreach ($errors as $error) {
            $this->addFlash('danger', $error->getMessage());
        }
    }

    return $this->render('product/index.html.twig', [
        'products' => $products,
        'user' => $user,
        'search' => $form->createView(),
        'page' => $page,
    ]);
}


    /**
     * @Route("/search", name="search")
     */
    public function searchProducts(Request $request)
    {
        $searchTerm = $request->query->get('q', '');
        
        $searchResults = $this->elasticsearchService->searchProducts($searchTerm);
      

        if (empty($searchResults)) {
            return $this->render('error_custom.html.twig');
        }

        return $this->render('product/search.html.twig', [
            'products' => $searchResults,
            'searchTerm' => $searchTerm,
        ]);
    }

/**
 * @Route("/products/{slug}", name="product")
 */
    public function show($slug , SizeSorter $sizeSorter): Response
    {
    
        $user = $this->getUser();
        $product = $this->entityManager->getRepository(Product::class)->findOneBy(['slug' => $slug]);
        $sortedSizes = $sizeSorter->sortSizes($product->getSizes());
        

        if (!$product) {
            return $this->redirectToRoute('products');
        }

        // Enregistrez le produit comme récemment consulté si l'utilisateur est connecté
        if ($user) {
            $recentlyViewedProduct = new RecentlyViewedProduct();
            $recentlyViewedProduct->setProduct($product);
            $recentlyViewedProduct->setUser($user);
            $recentlyViewedProduct->setViewedAt(new \DateTimeImmutable());

            $this->entityManager->persist($recentlyViewedProduct);
            $this->entityManager->flush();
        }

        return $this->render('product/show.html.twig', [
            'product' => $product,
            'product' => $product,
            'sizes' => $sortedSizes,
        ]);
    }

/**
 * @Route("/productsCategory/{id}", name="product_category")
 * @ParamConverter("category", class="App\Entity\Category")
 */
    public function showCategory(
        PaginatorInterface $paginator,
        Category $category,
        Request $request,
        ProductRepository $repProduct,
        RecentlyViewedProductRepository $recentlyViewedProductRepository,
        ?RecentlyViewedProduct $recentlyViewedProduct = null
    ): Response {
        $user = $this->getUser();
        if (!$category) {
            throw $this->createNotFoundException('La catégorie demandée n\'a pas été trouvée.');
        }

        $search = new SearchProduct();
        $form = $this->createForm(SearchProductsType::class, $search);
        $form->handleRequest($request);

        $products = $paginator->paginate(
            $repProduct->findWithSearch($search, $category),
            $request->query->getInt('page', 1),
            8/*limit per page*/
        );

        if ($form->isSubmitted() && !$form->isValid()) {
            // gestion des erreurs
            $errors = $form->getErrors(true);
            foreach ($errors as $error) {
                $this->addFlash('danger', $error->getMessage());
            }
        }

        $recentlyViewedProducts = [];
        if ($user) {
            $recentlyViewedProductIds = $recentlyViewedProductRepository->findRecentlyViewedProductIdsByUser($user, new DateTime('-24 hours'));
            $recentlyViewedProducts = $repProduct->findRecentlyViewedProductsByProductIdsAndCategory($recentlyViewedProductIds, $category);
        }

        // Retourner la vue avec les produits, la catégorie et les produits consultés récemment
        return $this->render('product/showCategory.html.twig', [
            'products' => $products,
            'search' => $form->createView(),
            'category' => $category,
            'user' => $user,
            'recentlyViewedProducts' => $recentlyViewedProducts,
            'recentlyViewedProduct' => $recentlyViewedProduct,

        ]);
    }

}
