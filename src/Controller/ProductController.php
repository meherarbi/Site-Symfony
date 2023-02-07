<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\RecentlyViewedProduct;
use App\Entity\SearchProduct;
use App\Form\SearchProductsType;
use App\Repository\ProductRepository;
use App\Repository\RecentlyViewedProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query;
use Knp\Component\Pager\PaginatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/product", name="products")
     */
    public function index(PaginatorInterface $paginator, Request $request, EntityManagerInterface $manager, ProductRepository $productrepository)
    {
        /* $products = $this->entityManager->getRepository(Product::class)->findAll(); */
        /*  $search = new Search(); */
        /* $form = $this->createForm(SearchType::class, $search); */

        $products = $paginator->paginate(
            $productrepository->findAll(),
            $request->query->getInt('page', 1),
            /*page number*/
            8/*limit per page*/
        );

        return $this->render('product/index.html.twig', [
            'products' => $products,
            /*  'form' => $form->createView(), */

        ]);
    }

    /**
     * @Route("/products/{id}", name="product")
     */
    public function show($id): Response
    {
        $product = $this->entityManager->getRepository(Product::class)->find($id);
        if (!$product) {
            return $this->redirectToRoute('products');
        }
        return $this->render('product/show.html.twig', [
            'product' => $product,

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
        ProductRepository $repProduct
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

        // Enregistrer l'historique de consultation de produits
        foreach ($products->getItems() as $product) {
            $recentlyViewedProduct = new RecentlyViewedProduct();
            $recentlyViewedProduct->setProduct($product);
            $recentlyViewedProduct->setUser($user);

            $this->getDoctrine()->getManager()->persist($recentlyViewedProduct);
        }
        $this->getDoctrine()->getManager()->flush();

        // Récupérer les produits consultés récemment
        $recentlyViewedProducts = $this->getDoctrine()
            ->getRepository(RecentlyViewedProduct::class)
            ->findBy(['user' => $user], ['id' => 'DESC']);

        // Retourner la vue avec les produits, la catégorie et les produits consultés récemment
        return $this->render('product/showCategory.html.twig', [
            'products' => $products,
            'search' => $form->createView(),
            'category' => $category,
            'user' => $user,
            'recentlyViewedProducts' => $recentlyViewedProducts,
        ]);
    }

}
