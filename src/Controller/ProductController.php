<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\SearchProduct;
use App\Form\SearchProductsType;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\Query;

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
            8 /*limit per page*/
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
 */
public function showCategory(PaginatorInterface $paginator, Category $category, Request $request, ProductRepository $repProduct): Response
{
    if (!$category) {
        return $this->redirectToRoute('home');
    }

    $search = new SearchProduct();
    $form = $this->createForm(SearchProductsType::class, $search);
    $form->handleRequest($request);

    $products = $paginator->paginate(
        $repProduct->findWithSearch($search, $category),
        $request->query->getInt('page', 1),
        8 /*limit per page*/
    );

    if ($form->isSubmitted() && !$form->isValid()) {
        // gestion des erreurs
        $errors = $form->getErrors(true);
        foreach ($errors as $error) {
            $this->addFlash('danger', $error->getMessage());
        }
    }

    return $this->render('product/showCategory.html.twig', [
        'products' => $products,
        'search' => $form->createView(),
        'category' => $category,
    ]);
}
}
