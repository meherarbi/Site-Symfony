<?php

namespace App\Controller;

use App\Classe\Search;
use App\Entity\Category;
use App\Entity\Product;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;
    public function  __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager= $entityManager;

    }
    /**
     * @Route("/product", name="products")
     */
    public function index()
    {
        $products=$this->entityManager->getRepository(Product::class)->findAll();
        $search=new Search();
        $form=$this->createForm(SearchType::class,$search);
        return $this->render( 'product/index.html.twig',[
            'products'=>$products,
            'form'=>$form->createView()

        ]);
    }

    /**
     * @Route("/products/{slug}", name="product")
     */
    public function show($slug): Response
    {
        $product=$this->entityManager->getRepository(Product::class)->findOneBySlug($slug);
        if(!$product){
            return $this->redirectToRoute('products');
        }
        return $this->render( 'product/show.html.twig',[
            'product'=>$product

        ]);
    }

     /**
     * @Route("/productsCategory/{id}", name="product_category")
     */
    public function showCategory(Category $category): Response
    {
        if ($category){
            $products=$category->getProducts()->getValues();
        }
        else {
            return $this->redirectToRoute( 'home') ;
        }
        
        
      
        return $this->render( 'product/showCategory.html.twig',[
            'products'=>$products

        ]);
    }
}
