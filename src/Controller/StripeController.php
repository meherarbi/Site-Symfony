<?php

namespace App\Controller;

use App\Service\Cart;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/commande/create-session", name="stripe_create_session")
     */
    public function index(Cart $cart)
    {
        $products_for_stripe = [];
        $YOUR_DOMAIN = 'https://foryoumer.com';

        // Récupérer l'entité Order en cours
        $order = $this->entityManager->getRepository(Order::class)->findOneBy([
            'user' => $this->getUser(),
            'isPaid' => false
        ]);

        // Ajouter les produits du panier
        foreach ($cart->getFull() as $product) {
            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'usd',
                    'unit_amount' => $product['product']->getPrice(),
                    'product_data' => [
                        'name' => $product['product']->getName(),
                        'images' => [$YOUR_DOMAIN . "/uploads/" . $product['product']->getIllustration()],
                    ],
                ],
                'quantity' => $product['quantity'],

            ];

        }

        // Ajouter le prix du transporteur
        $products_for_stripe[] = [
            'price_data' => [
                'currency' => 'usd',
                'unit_amount' => $order->getCarrierPrice() * 100, // Convertir en centimes
                'product_data' => [
                    'name' => 'Frais de livraison',
                    'description' => $order->getCarrierName(),
                ],
            ],
            'quantity' => 1,
        ];

        Stripe::setApiKey('sk_test_51ISlCKJ2GpGkE0V3DrWMXnDfmbK07IngdbjLXELGOMhlJbu2UKutNT7VcThbg0Wl6kgw1R6Bv4BBIp5qU9mf6uhV00MgnkU1iK');

        $checkout_session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [$products_for_stripe],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/success',
            'cancel_url' => $YOUR_DOMAIN . '/cancel.html',
        ]);

        $response = new JsonResponse(['id' => $checkout_session->id]);
        return $response;

    }
}
