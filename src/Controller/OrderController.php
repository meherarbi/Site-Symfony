<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\OrderDetails;
use App\Form\OrderType;
use App\Repository\SizeRepository;
use App\Service\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Price;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\PayPalService;
use Symfony\Component\HttpFoundation\Response;


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
    public function recap(Cart $cart, Request $request , SizeRepository $sizeRepository)
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
            /* dd($cart->getFull()); */
            // Enregistre les détails de produits
            foreach ($cart->getFull() as $product) {

                
                $size = null;
                $quantity = 0;
            
                if (is_array($product['quantity'])) {
                    $size = $sizeRepository->findOneBy(['name' => $product['quantity']['size']]);
                    $quantity = $product['quantity']['quantity'];
                } else {
                    $quantity = $product['quantity'];
                }



                $orderDetails = new OrderDetails();
                $orderDetails->setMyOrder($order);
                $orderDetails->setProduct($product['product']);
                $orderDetails->setQuantity($quantity);
                $orderDetails->setPrice($product['product']->getPrice());
                $orderDetails->setTotal($product['product']->getPrice() * $product['quantity']['quantity']);
                if ($size !== null) {
                    $orderDetails->setSizes($size);
                }
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
/**
 * @Route("/commande/paypal", name="order_payment")
 */
public function orderPayment(PayPalService $paypalService, Cart $cart, EntityManagerInterface $entityManager)
{
    $total = 0;

    foreach ($cart->getFull() as $product) {
        $prix = (float) $product['product']->getPrice();
        $quantite = is_array($product['quantity']) ? (int) $product['quantity']['quantity'] : (int) $product['quantity'];

        // ✅ Vérifier si le prix est en centimes et le corriger
        if ($prix > 10) { 
            $prix = $prix / 100;
        }

        $total += $prix * $quantite;
    }

    // ✅ Récupérer la dernière commande dynamiquement
    $query = $entityManager->createQuery('
        SELECT o FROM App\Entity\Order o 
        WHERE o.user = :user AND o.isPaid = 0 
        ORDER BY o.id DESC
    ')->setParameter('user', $this->getUser());

    $order = $query->setMaxResults(1)->getOneOrNullResult();

    if ($order) {
        // ✅ Ajouter les frais de livraison
        $carrierPrice = (float) $order->getCarrierPrice();
        $total += $carrierPrice;
    } else {
        return $this->redirectToRoute('cart'); // Redirection si aucune commande trouvée
    }

    return $this->redirect($paypalService->createPayment($total));
}












/**
 * @Route("/commande/paypal/success", name="paypal_success")
 */
public function paypalSuccess(Request $request, PayPalService $paypalService, EntityManagerInterface $entityManager)
{
    $paymentId = $request->query->get('paymentId');
    $payerId = $request->query->get('PayerID');

    if (!$paymentId || !$payerId) {
        return $this->redirectToRoute('order');
    }

    try {
        $paypalService->executePayment($paymentId, $payerId);
        // Marquez la commande comme payée
        $order = $entityManager->getRepository(Order::class)->findOneBy(['isPaid' => false]);
        if ($order) {
            $order->setIsPaid(true);
            $entityManager->flush();
        }
        return new Response("Paiement réussi !");
    } catch (\Exception $e) {
        return new Response("Erreur de paiement PayPal : " . $e->getMessage());
    }
}

/**
 * @Route("/commande/paypal/cancel", name="paypal_cancel")
 */
public function paypalCancel()
{
    return new Response("Paiement annulé.");
}

}
