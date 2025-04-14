<?php
namespace App\Service;


use PayPal\Api\Amount;
use PayPal\Api\ItemList;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Payer;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class PayPalService
{
    private $apiContext;
    private $router;

    public function __construct(
        string $paypalClientId,
        string $paypalSecret,
        string $paypalMode,
        ?string $paypalCAInfo, // 📌 Optionnel pour éviter l'erreur en production
        UrlGeneratorInterface $router
    ) {
        $this->apiContext = new ApiContext(
            new OAuthTokenCredential($paypalClientId, $paypalSecret)
        );

        // ✅ Configuration PayPal avec une gestion de l'environnement
        $config = [
            'mode' => $paypalMode,
            'cache.enabled' => true,
        ];

        // ✅ Ajouter le fichier SSL uniquement en mode sandbox
        if ($paypalMode === 'sandbox' && $paypalCAInfo) {
            $config['http.CURLOPT_CAINFO'] = $paypalCAInfo;
        }

        $this->apiContext->setConfig($config);
        $this->router = $router;
    }

    public function createPayment(float $total)
    {
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');
    
        $total = round((float) $total, 2);
        $totalString = number_format($total, 2, '.', '');
    
        $amount = new Amount();
        $amount->setCurrency('EUR');
        $amount->setTotal($totalString);
    
        $transaction = new Transaction();
        $transaction->setAmount($amount);
        $transaction->setDescription("Paiement de votre commande");

        // ✅ Correction : Ajouter un ItemList vide pour éviter l'erreur `sizeof()`
        $itemList = new ItemList();
        $itemList->setItems([]);
        $transaction->setItemList($itemList);
    
        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl($this->router->generate('paypal_success', [], UrlGeneratorInterface::ABSOLUTE_URL))
                     ->setCancelUrl($this->router->generate('paypal_cancel', [], UrlGeneratorInterface::ABSOLUTE_URL));
    
        $payment = new Payment();
        $payment->setIntent('sale')
                ->setPayer($payer)
                ->setRedirectUrls($redirectUrls)
                ->setTransactions([$transaction]);
    
        try {
            $payment->create($this->apiContext);
        } catch (\Exception $e) {
            throw new \Exception("Erreur PayPal : " . $e->getMessage());
        }
    
        return $payment->getApprovalLink();
    }

    public function executePayment($paymentId, $payerId)
    {
        $payment = Payment::get($paymentId, $this->apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId($payerId);

        try {
            return $payment->execute($execution, $this->apiContext);
        } catch (\Exception $e) {
            throw new \Exception("Erreur d'exécution PayPal : " . $e->getMessage());
        }
    }
}
