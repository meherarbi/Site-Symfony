<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use App\Service\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/my-cart", name="cart_")
 */
class CartController extends AbstractController
{
    private $em;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->em = $entityManager;
    }
    private function setNoCacheHeaders(Response $response): void
    {
        $response->headers->set('Cache-Control', 'no-store, must-revalidate');
        $response->headers->set('Pragma', 'no-cache');
        $response->headers->set('Expires', '0');
    }

    /**
     * @Route("/", name="index")
     */
    public function index(Cart $cart, SessionInterface $session)
{
    $cartcomplete = [];
    $cartItems = $cart->get();
    
    if ($cartItems !== null) {
        foreach ($cartItems as $id => $quantity) {
            $cartcomplete[] = [
                'product' => $this->em->getRepository(Product::class)->find($id),
                'quantity' => $quantity,
            ];
        }
    }

    // Mettez à jour la quantité de produits différents dans la session
    $this->updateProductCount($session);

    $response = $this->render('cart/index.html.twig', [
        'cart' => $cartcomplete,
    ]);
    
    $this->setNoCacheHeaders($response);
    return $response;
}
private function updateProductCount(SessionInterface $session): void
{
    // Récupérez les produits dans le panier (remplacez ceci par votre propre logique)
    $cartItems = $session->get('cart', []);

    // Comptez le nombre de produits différents dans le panier
    $productCount = count($cartItems);

    // Mettez à jour la quantité de produits différents dans la session
    $session->set('uniqueProductsCount', $productCount);
}


    /**
 * @Route("/cart/add/{slug}", name="add_to_cart")
 */
public function add(Cart $cart, Request $request, ProductRepository $productRepository, $slug, SessionInterface $session)
{
    $product = $productRepository->findOneBy(['slug' => $slug]);

    if (!$product) {
        throw $this->createNotFoundException('The product does not exist');
    }

    $cart->add($product->getId());

    // Récupérez le panier de la session
    $cart = $session->get('cart', []);

    // Mettez à jour la quantité de produits différents dans la session
    $uniqueProductsCount = count($cart);
    $session->set('uniqueProductsCount', $uniqueProductsCount);

    // Mettez à jour la quantité de produits différents dans la session
    $this->updateProductCount($session, 1);

    $response = $this->redirectToRoute('cart_index');
    $this->setNoCacheHeaders($response);
    return $response;
}

    /**
     * @Route("/cart/remove", name="remove_my_cart")
     */
    public function remove(Cart $cart, SessionInterface $session)
    {

        $cart->remove();
        $cart = $session->get('cart', []);

        // Mettez à jour la quantité de produits différents dans la session
        $uniqueProductsCount = count($cart);
        $session->set('uniqueProductsCount', $uniqueProductsCount);

        // Mettez à jour la quantité de produits différents dans la session
        $this->updateProductCount($session, -1);

        $response = $this->redirectToRoute('cart_index');
        $this->setNoCacheHeaders($response);
        return $response;
    }

/**
     * @Route("/cart/delete/{id}", name="delete_my_cart")
     */
    public function delete(Cart $cart, $id,SessionInterface $session)
    {
        $cart->delete($id);

        // Mettez à jour la quantité de produits différents dans la session
    $this->updateProductCount($session);

        return $this->redirectToRoute('cart_index');
    }



    /**
     * @Route("/cart/decrease/{slug}", name="decrease_my_cart")
     */
    public function decrease(Cart $cart, $slug,ProductRepository $productRepository)
    {
        $product = $productRepository->findOneBy(['slug' => $slug]);

        if (!$product) {
            throw $this->createNotFoundException('The product does not exist');
        }
        $cart->decrease($product->getId());

        return $this->redirectToRoute('cart_index');
    }

    /**
     * @Route("/cart/update", name="update_cart")
     */
    public function update(Request $request, Cart $cart)
    {
        if ($request->isXmlHttpRequest()) {
            $id = $request->request->get('id');
            $action = $request->request->get('action');

            switch ($action) {
                case 'add':
                    $cart->add($id);
                    break;
                case 'remove':
                    $cart->remove($id);
                    break;
            }

            return new JsonResponse(['success' => true]);
        }

        return new JsonResponse(['success' => false]);
    }



}
