<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Cache\CacheInterface;

class HomeController extends AbstractController
{
    public function __construct(private ProductRepository $productRepository, private CategoryRepository $categoryRepository)
    {

    }

/**
 * @Route("/", name="home", methods={"GET", "POST"})
 */
    public function index()
    {
        /* if ($request->request->has('Id')) {
        $productId = $request->request->get('Id');

        $productGroup = $this->productRepository->findProductsGroupByCategory($productId);

        return $this->render('home/index.html.twig', [
        'products' => $productGroup,
        'categories' => $this->categoryRepository->findAll(),
        ]);
        } */
        

        $products = $this->productRepository->findAll();
        $latestProducts = $this->productRepository->findProduct();
        /* $latestProductsCategory = $this->productRepository->LatestProductCategory(); */
        $productsOneByCategory = $this->productRepository->findProductByCategory();
        $productsMin = $this->productRepository->findProductMin();
        $promotedProducts = $this->productRepository->findPromotedProducts();
        /* $categories = $this->categoryRepository->findAllCached(); */
        $categories = $this->categoryRepository->findAll();
        $promotedProductsByCategory = [];

        foreach ($categories as $category) {
            $promotedProductsByCategory[$category->getId()] = $this->productRepository->findPromotedProductsByCategory($category->getId());
        }

        $latestProductsCategory = [];

        foreach ($categories as $category) {
            $latestProductsCategory[$category->getId()] = $this->productRepository->findLatestProductsByCategory($category->getId(), 3);
        }

        $icons = [
            'Homme' => 'fas fa-tshirt',
            'Femme' => 'fas fa-female',
            'Electronique' => 'fas fa-laptop',
            'Accessoire' => 'fas fa-mobile-alt',
            'Jouets et enfants' => 'fas fa-baby-carriage',
            'Beauté et santé' => 'fas fa-leaf',
            'Outils et bricolage' => 'fas fa-wrench',
            'Protéines & Compléments' => 'fas fa-dumbbell',
        ];

        $response = $this->render('home/index.html.twig', [
            'products' => $products,
            'latestProducts' => $latestProducts,
            'latestProductsCategory'=>$latestProductsCategory,
            'productsOneByCategory' => $productsOneByCategory,
            'productsMin' => $productsMin,
            'promoted_products' => $promotedProducts,
            'promotedProductsByCategory' => $promotedProductsByCategory,
            'categorie' => $this->categoryRepository->findAll(),
            'icons' => $icons,
        ]);
        $response->headers->remove('X-Robots-Tag');

        return $response;
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

    /**
     * @Route("/category/{id}/products", name="category_products")
     */
    public function getCategoryProducts(int $id)
    {
        $products = $this->productRepository->findLatestProductsByCategory($id);
        $productsArray = array_map(fn($product) => $product->toArray(), $products);
        return new JsonResponse($productsArray);
    }

}
