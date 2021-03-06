<?php

namespace App\Form;

use App\Entity\Address;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name',TextType::class, [
                'label'=>'Donnez un titre pour votre adresse'])
            ->add('firstname',TextType::class)
            ->add('lastname',TextType::class)
            ->add('company',TextType::class,[
                'required'=>false
            ])
            ->add('address',TextType::class)
            ->add('postal',TextType::class)
            ->add('city',TextType::class)
            ->add('country' ,CountryType::class)
            ->add('phone')
            ->add('submit',SubmitType::class,[
                'label'=>'Ajouter mon adresse',
                'attr'=>[
                    'class'=>'btn-block btn-info'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Address::class,
        ]);
    }
}
