<?php

namespace App\Controller;

use App\Entity\Address;
use App\Form\AddressType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountAddressController extends AbstractController
{
    /**
     * @Route("/compte/address", name="account_address")
     */
    public function index()
    {
        return $this->render('account/address.html.twig');
    }

    /**
     * @Route("/compte/ajouter-une-adresse", name="account_address_add")
     */
    public function add(Request $request)
    {
        $address=new Address();
        $form=$this->createForm(AddressType::class,$address);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){

        }
        return $this->render('account/address.html.twig',[
            'form'=>$form->createView()
        ]);
    }
}
