<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    public function __construct(private ProductRepository $productRepository, private CategoryRepository $categoryRepository)
    {

    }

/**
 * @Route("/", name="home", methods={"GET", "POST"})
 */
    public function index(Request $request)
    {
        /* if ($request->request->has('Id')) {
            $productId = $request->request->get('Id');
            
            $productGroup = $this->productRepository->findProductsGroupByCategory($productId);

            return $this->render('home/index.html.twig', [
                'products' => $productGroup,
                'categories' => $this->categoryRepository->findAll(),
            ]);
        } */

        $products = $this->productRepository->findProduct();
        $productsOneByCategory = $this->productRepository->findProductByCategory();
        $productsMin = $this->productRepository->findProductMin();
        $promotedProducts = $this->productRepository->findPromotedProducts();
        $categories = $this->categoryRepository->findAll();
        $promotedProductsByCategory = [];
    
        foreach ($categories as $category) {
            $promotedProductsByCategory[$category->getId()] = $this->productRepository->findPromotedProductsByCategory($category->getId());
        }

        $icons = [
            'Homme' => 'fas fa-tshirt',
            'Femme' => 'fas fa-female',
            'Electronique' => 'fas fa-laptop',
            'Accessoire' => 'fas fa-mobile-alt',
            'Jouets et enfants' => 'fas fa-baby-carriage',
            'Beauté et santé' => 'fas fa-leaf',
            'Outils et bricolage' => 'fas fa-wrench'
        ];
        
        
        
        
        
        
        
        

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'productsOneByCategory'=>$productsOneByCategory,
            'productsMin'=>$productsMin,
            'promoted_products' => $promotedProducts,
            'promotedProductsByCategory' => $promotedProductsByCategory,
            'categorie' => $this->categoryRepository->findAll(),
            'icons' => $icons
        ]);
    }

/* public function index(Category $category = null)
{
// Récupérer toutes les catégories
$categorie = $this->categoryRepository->findAll();

// Si une catégorie est passée en paramètre
if ($category) {
// Récupérer les produits de cette catégorie
$products = $category->getProducts()->getValues();
} else {
// Sinon, récupérer tous les produits
$products = $this->productRepository->findAll();
}

return $this->render('home/index.html.twig', [
'products' => $products,
'categorie' => $categorie,
]);
}
 */

    /**
     * @Route("/categoriemenu", name="categorie_menu")
     */
    public function categorieMenu()
    {

        $categories = $this->categoryRepository->findAll();

        return $this->render('home/categorie_menu.html.twig',

            ['categories' => $categories]);

    }

}
