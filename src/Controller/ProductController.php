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
    public function index(PaginatorInterface $paginator, Request $request , EntityManagerInterface $manager , ProductRepository $productrepository )
    {
        /* $products = $this->entityManager->getRepository(Product::class)->findAll(); */
        /*  $search = new Search(); */
        /* $form = $this->createForm(SearchType::class, $search); */

        $products = $paginator->paginate(
            
            $productrepository->findAll(),
            $request->query->getInt('page', 1), /*page number*/
            3/*limit per page*/
        );
       
        return $this->render('product/index.html.twig', [
            'products' => $products,
            /*  'form' => $form->createView(), */

        ]);
    }

    /**
     * @Route("/products/{slug}", name="product")
     */
    public function show($slug): Response
    {
        $product = $this->entityManager->getRepository(Product::class)->findOneBySlug($slug);
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
    public function showCategory(Category $category, Request $request, ProductRepository $repProduct): Response
    {
        if ($category) {
            $products = $category->getProducts()->getValues();
        } else {
            return $this->redirectToRoute('home');
        }
        $search = new SearchProduct();

        $form = $this->createForm(SearchProductsType::class, $search);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $products = $repProduct->findWithSearch($search);

        }

        return $this->render('product/showCategory.html.twig', [
            'products' => $products,
            'search' => $form->createView(),

        ]);
    }
}
