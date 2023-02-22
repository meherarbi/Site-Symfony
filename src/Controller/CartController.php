<?php

namespace App\Controller;

use App\Service\Cart;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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
    /**
     * @Route("/", name="index")
     */
    public function index(Cart $cart)
    {

        $cartcomplete = [];
        foreach ($cart->get() as $id => $quantity) {

            $cartcomplete[] = [
                'product' => $this->em->getRepository(Product::class)->find($id),
                'quantity' => $quantity
            ];
        }


        return $this->render('cart/index.html.twig', [
            'cart' => $cartcomplete,
        ]);
    }

  /**
 * @Route("/cart/add/{id}", name="add_to_cart")
 */
public function add(Cart $cart, Request $request, $id)
{

        $cart->add($id);
   

    return $this->redirectToRoute('cart_index');
}


  


    /**
     * @Route("/cart/remove", name="remove_my_cart")
     */
    public function remove(Cart  $cart)
    {
        
        $cart->remove();

        return $this->redirectToRoute('products');
    }

    /**
     * @Route("/cart/delete/{id}", name="delete_my_cart")
     */
    public function delete(Cart  $cart, $id)
    {
        $cart->delete($id);

        return $this->redirectToRoute('cart_index');
    }

    /**
     * @Route("/cart/decrease/{id}", name="decrease_my_cart")
     */
    public function decrease(Cart  $cart, $id)
    {
        $cart->decrease($id);

        return $this->redirectToRoute('cart_index');
    }

 

}