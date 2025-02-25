<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class RegisterController extends AbstractController
{
    private EntityManagerInterface $entityManager;
    private UserPasswordHasherInterface $passwordHasher;

    public function __construct(EntityManagerInterface $entityManager, UserPasswordHasherInterface $passwordHasher)
    {
        $this->entityManager = $entityManager;
        $this->passwordHasher = $passwordHasher;
    }

    #[Route('/inscription', name: 'register')]
    public function index(Request $request, ValidatorInterface $validator): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $email = $user->getEmail();
            $existingUser = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);

            if ($existingUser) {
                $this->addFlash('danger', 'Cette adresse e-mail est déjà utilisée.');
                return $this->redirectToRoute('register');
            }

            // Validation de l'email
            $emailErrors = $validator->validate($email, [
                new NotBlank(['message' => 'Veuillez entrer une adresse e-mail']),
                new Email(['message' => 'L\'adresse e-mail "{{ value }}" n\'est pas valide.'])
            ]);

            // Validation du mot de passe
            $password = $user->getPassword();
            $passwordErrors = $validator->validate($password, [
                new NotBlank(['message' => 'Veuillez entrer un mot de passe']),
                new Regex([
                    'pattern' => '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-_=+{};:,<.>§~?]).{8,}$/',
                    'message' => 'Le mot de passe doit contenir au moins 8 caractères, avec une majuscule, une minuscule, un chiffre et un caractère spécial.'
                ])
            ]);

            if (count($emailErrors) > 0 || count($passwordErrors) > 0) {
                foreach (array_merge(iterator_to_array($emailErrors), iterator_to_array($passwordErrors)) as $error) {
                    $this->addFlash('danger', $error->getMessage());
                }
                return $this->redirectToRoute('register');
            }

            // Hachage du mot de passe
            $hashedPassword = $this->passwordHasher->hashPassword($user, $password);
            $user->setPassword($hashedPassword);

            // Sauvegarde en base de données
            $this->entityManager->persist($user);
            $this->entityManager->flush();

            // Redirection vers la page de connexion
            $this->addFlash('success', 'Votre compte a été créé avec succès.');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('register/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
