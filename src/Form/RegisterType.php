<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Validation;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname', TextType::class, [
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter your first name'
                    ]),
                    new Length([
                        'min' => 3,
                        'max' => 30,
                        'minMessage' => 'Your first name must be at least {{ limit }} characters long',
                        'maxMessage' => 'Your first name cannot be longer than {{ limit }} characters'
                    ])
                ]
            ])
            ->add('lastname', TextType::class, [
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter your last name'
                    ]),
                    new Length([
                        'min' => 3,
                        'max' => 30,
                        'minMessage' => 'Your last name must be at least {{ limit }} characters long',
                        'maxMessage' => 'Your last name cannot be longer than {{ limit }} characters'
                    ])
                ]
            ])
            ->add('email', EmailType::class, [
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter your email address'
                    ]),
                    new Email([
                        'message' => 'The email address {{ value }} is not valid'
                    ])
                ]
            ])
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'The password fields must match',
                'required' => true,
                'first_options' => ['label' => 'Password'],
                'second_options' => ['label' => 'Confirm Password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a password'
                    ]),
                    new Length([
                        'min' => 8,
                        'max' => 50,
                        'minMessage' => 'Your password must be at least {{ limit }} characters long',
                        'maxMessage' => 'Your password cannot be longer than {{ limit }} characters'
                    ])
                ]
            ])
            ->add('termsAccepted', CheckboxType::class, [
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'You must accept the terms and conditions to register'
                    ])
                ],
                'label' => 'I accept the terms and conditions'
            ])
            ->add('submit', SubmitType::class, ['label' => 'Register']);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
    public function getBlockPrefix()
    {
        return 'registration';
    }
}
