<?php

namespace App\Controller;

use App\Form\ChangePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;


class AccountPasswordController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/account/Changepassword", name="account_password")
     */
    public function index(Request $request, UserPasswordHasherInterface $encoder,SessionInterface $session,TokenStorageInterface $tokenStorage)
    {
        $notification = null;

        $user = $this->getUser();
        $form = $this->createForm(ChangePasswordType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $old_pwd = $form->get('old_password')->getData();
            if ($encoder->isPasswordValid($user, $old_pwd)) {$new_pwd = $form->get('new_password')->getData();
                $password = $encoder->hashPassword($user, $new_pwd);
                $user->setPassword($password);
                $this->entityManager->flush();
                $notification = "Your Password is successfully modified ";
                $tokenStorage->setToken(null);
                $session->invalidate();
                return $this->redirectToRoute('app_login');
            } else {
                $notification = "Your Password is not valid ";
            }
            
        }
        
        return $this->render('account/password.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification,
            'redirect' => $notification === "Your Password is successfully modified "
        ]);
        
    }
}
