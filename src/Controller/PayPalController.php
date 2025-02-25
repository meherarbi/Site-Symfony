<?php

namespace App\Controller;

use App\Service\Cart;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\PayPalService;
use Exception;

 class PayPalController extends AbstractController
 {
//     private $entityManager;
//     private $payPalService;

//     public function __construct(EntityManagerInterface $entityManager, PayPalService $payPalService)
//     {
//         $this->entityManager = $entityManager;
//         $this->payPalService = $payPalService;
//     }

//     /**
//      * @Route("/commande/create-session", name="paypal_create_payment")
//      */
//     public function index(Cart $cart)
//     {
//         $apiContext = $this->payPalService->getApiContext();
//         $order = $this->entityManager->getRepository(Order::class)->findOneBy([
//             'user' => $this->getUser(),
//             'isPaid' => false,
//         ]);

//         $payer = new \PayPal\Api\Payer();
//         $payer->setPaymentMethod("paypal");

//         $items = [];
//         foreach ($cart->getFull() as $product) {
//             $item = new \PayPal\Api\Item();
//             $item->setName($product['product']->getName())
//                  ->setCurrency('USD')
//                  ->setQuantity($product['quantity'])
//                  ->setPrice($product['product']->getPrice());
//             $items[] = $item;
//         }

//         $itemList = new \PayPal\Api\ItemList();
//         $itemList->setItems($items);

//         $amount = new \PayPal\Api\Amount();
//         $amount->setCurrency("USD")
//                ->setTotal($order->getTotal());

//         $transaction = new \PayPal\Api\Transaction();
//         $transaction->setAmount($amount)
//                     ->setItemList($itemList)
//                     ->setDescription("Achat sur votre site")
//                     ->setInvoiceNumber(uniqid());

//         $redirectUrls = new \PayPal\Api\RedirectUrls();
//         $redirectUrls->setReturnUrl("https://example.com/success")
//                      ->setCancelUrl("https://example.com/cancel");

//         $payment = new \PayPal\Api\Payment();
//         $payment->setIntent("sale")
//                 ->setPayer($payer)
//                 ->setRedirectUrls($redirectUrls)
//                 ->setTransactions(array($transaction));

//         try {
//             $payment->create($apiContext);
//         } catch (Exception $ex) {
//             // Gérer l'exception
//             exit(1);
//         }

//         return new RedirectResponse($payment->getApprovalLink());
//     }
 }
