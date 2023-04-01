<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RequestResetPasswordType;
use App\Form\ResetPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Mime\Email;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class ResetPasswordController extends AbstractController
{
    private $entityManager;
    private $passwordEncoder;
    private $twig;
    
    public function __construct(EntityManagerInterface $entityManager , UserPasswordHasherInterface $passwordEncoder,Environment $twig)
    {
        $this->entityManager = $entityManager;
        $this->passwordEncoder = $passwordEncoder;
        $this->twig = $twig;
        
    }
    #[Route('/request-reset-password', name: 'app_request_reset_password')]
    public function requestResetPassword(Request $request, MailerInterface $mailer): Response
    {
        $form = $this->createForm(RequestResetPasswordType::class);
        $form->handleRequest($request);
    
        if ($form->isSubmitted() && $form->isValid()) {
            $email = $form->get('email')->getData();
    
            $user = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);
    
            if (!$user) {
                return new JsonResponse([
                    'success' => false,
                    'message' => 'Cet e-mail n\'est pas associé à un compte utilisateur existant.'
                ]);
            }
    
            $token = bin2hex(random_bytes(32));
            $user->setResetPasswordToken($token);
            $user->setResetPasswordTokenExpiresAt(new \DateTime('+1 day'));
            $this->entityManager->flush();
    
            // Utiliser la méthode sendResetPasswordEmail pour envoyer l'e-mail
            $this->sendResetPasswordEmail($user, $token, $mailer);
    
            return new JsonResponse([
                'success' => true,
                'redirectUrl' => $this->generateUrl('app_check_email')
            ]);
        }
    
        return $this->render('reset_password/request.html.twig', [
            'form' => $form->createView(),
        ]);
    }
    

    #[Route('/reset-password/{token}', name: 'app_reset_password')]
    public function resetPassword(string $token, Request $request,MailerInterface $mailer): Response
    {
       
        $user = $this->entityManager->getRepository(User::class)->findOneBy(['resetPasswordToken' => $token]);

        if (!$user || $user->isResetPasswordTokenExpired()) {
            // Token invalide ou expiré, afficher un message d'erreur
            return $this->redirectToRoute('app_request_reset_password');
        }

        $form = $this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Encoder et définir le nouveau mot de passe
            $encodedPassword = $this->passwordEncoder->hashPassword($user, $form->get('plainPassword')->getData());
            $user->setPassword($encodedPassword);

            // Supprimer le token et la date d'expiration
            $user->setResetPasswordToken(null);
            $user->setResetPasswordTokenExpiresAt(null);

            $this->entityManager->flush();

    
            // Rediriger vers la page de connexion
            $this->sendResetPasswordEmail($user, $token, $mailer);
            return $this->redirectToRoute('app_login');
        }

        return $this->render('reset_password/reset.html.twig', [
            'form' => $form->createView(),
            'token' => $token
        ]);
    }

    public function sendResetPasswordEmail(User $user, string $token, MailerInterface $mailer)
    {
        $email = (new Email())
            ->from(new Address('no-reply@yourdomain.com', 'Your App'))
            ->to($user->getEmail())
            ->subject('Réinitialisation de votre mot de passe');

        $emailHtmlContent = $this->twig->render('reset_password/email/reset_password.html.twig', [
            'token' => $token,
        ]);

        $email->html($emailHtmlContent);

        $mailer->send($email);
    }


    

    #[Route('/check-email', name: 'app_check_email')]
    public function checkEmail(): Response
    {
        return $this->render('reset_password/check_email.html.twig');
    }
}

