<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class RegisterController extends AbstractController
{
    private $entityManager;
    private $encoder;

    public function __construct(EntityManagerInterface $entityManager, UserPasswordHasherInterface $encoder)
    {
        $this->entityManager = $entityManager;
        $this->encoder = $encoder;
    }

    /**
     * @Route("/inscription", name="register")
     */
    public function index(Request $request, ValidatorInterface $validator)
    {
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $email = $user->getEmail();
            $existingUser = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);

            if ($existingUser) {
                $this->addFlash('danger', 'This email address is already registered.');

                return $this->redirectToRoute('register');
            }

            $emailConstraint = new Email([
                'message' => 'The email address "{{ value }}" is not valid.',
            ]);

            $errors = $validator->validate($email, $emailConstraint);

            $password = $user->getPassword();

            $errors = $validator->validate($password, [
                new NotBlank([
                    'message' => 'Please enter a password'
                ]),
                new Regex([
                    'pattern' => '/^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[!@#$%^&()-_=+{};:,<.>§~?])[a-zA-Z\d!@#$%^&()-_=+{};:,<.>§~?]{8,}$/',
                    'message' => 'The password must contain at least 8 characters including at least one lowercase letter, one uppercase letter, and one digit.'
                ])
            ]);

            if (count($errors) > 0) {
                $this->addFlash('danger', 'The email address is not valid.');

                return $this->redirectToRoute('register');
            }

            $password = $this->encoder->hashPassword($user, $user->getPassword());
            $user->setPassword($password);
            $this->entityManager->persist($user);
            $this->entityManager->flush();

            $this->addFlash('success', 'Your account has been created successfully.');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('register/index.html.twig', [
            'form' => $form->createView()
        ]);
    }

}