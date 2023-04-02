<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\OrderDetails;
use App\Form\OrderType;
use App\Service\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Price;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/commande", name="order")
     */
    public function index(Cart $cart, Request $request)
    {
        if (!$this->getUser()->getAddresses()->getValues()) {
            return $this->redirectToRoute('account_address_add');
        }

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser(),
        ]);

        return $this->render('order/index.html.twig', [
            'form' => $form->createView(),
            'cart' => $cart->getFull(),

        ]);
    }

    /**
     * @Route("/commande/recap", name="order_recap" )
     */
    public function recap(Cart $cart, Request $request)
    {
        $form = $this->createForm(OrderType::class, null, [
            'method' => 'POST',
            'user' => $this->getUser(),
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $date = new \DateTime();
            $carriers = $form->get('carriers')->getData();
            $delivery = $form->get('addresses')->getData();
            $delivery_content = $delivery->getFirstname() . ' ' . $delivery->getLastname();
            $delivery_content .= ' ' . $delivery->getPhone();

            if ($delivery->getCompany()) {
                $delivery_content .= ' ' . $delivery->getCompany();
            }
            $delivery_content .= ' ' . $delivery->getAddress();
            $delivery_content .= ' ' . $delivery->getPostal() . ' ' . $delivery->getCity();

            $delivery_content = str_replace('<br/>', ' ', $delivery_content);

            $illustrations = [];
            foreach ($cart->getFull() as $product) {
                
                $illustrations[] = $product['product']->getIllustration();
            }

            $illustrationsJson = json_encode($illustrations);

            // Créer une nouvelle commande
            $order = new Order();
            $order->setUser($this->getUser());
            $order->setCreatedAt(new \DateTime());
            $order->setCarrierName($carriers->getName());
            $order->setCarrierPrice($carriers->getPrice());
            $order->setDelivery(strip_tags($delivery_content));
            $order->setIsPaid(false);
            $illustrationsJson = json_encode($illustrations);
            $illustrationsArray = json_decode($illustrationsJson, true);
            $order->setIllustration($illustrationsArray);
            
            $this->entityManager->persist($order);

            // Enregistre les détails de produits
            foreach ($cart->getFull() as $product) {
                $orderDetails = new OrderDetails();
                $orderDetails->setMyOrder($order);
                $orderDetails->setProduct($product['product']);
                $orderDetails->setQuantity($product['quantity']);
                $orderDetails->setPrice($product['product']->getPrice());
                $orderDetails->setTotal($product['product']->getPrice() * $product['quantity']);
                $illustration = $product['product']->getIllustration();
                $orderDetails->setIllustration($illustration); 
                $this->entityManager->persist($orderDetails);
            }

            $this->entityManager->flush();

            /*       return $this->redirectToRoute('order_payment', [
            'stripePublicKey' => $this->getParameter('stripe_public_key'),
            'orderId' => $order->getId()
            ]);
            } */

            return $this->render('order/recap.html.twig', [
                'cart' => $cart->getFull(),
                'carrier' => $carriers,
                'delivery' => $delivery_content,

            ]);

        }

        return $this->redirectToRoute('cart');
    }
}
