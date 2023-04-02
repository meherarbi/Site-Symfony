<?php

namespace App\Form;

use App\Entity\User;
use ContainerLdBS6gX\getChangePasswordTypeService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

            ->add('old_password',PasswordType::class,['label'=>'Current Password','mapped'=>false])
            ->add('new_password', RepeatedType::class,[
                'mapped'=>false,
                'type'=>PasswordType::class,
                'invalid_message'=>'Invalid Password',
                'required'=>true,
                'first_options'=>['label'=>'New Password'],
                'second_options'=>['label'=>'Confirm Password']
            ])
            

        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
