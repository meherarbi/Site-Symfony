<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class PaymentSuccessController extends AbstractController
{
    /**
     * @Route("/success", name="payment_success")
     */
    public function index()
    {
        return $this->render('payment_success/index.html.twig');
    }
}
