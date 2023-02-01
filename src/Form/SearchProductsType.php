<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SearchProductsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        /*   ->add('categories', EntityType::class, [
        'class' => Category::class,
        'label' => false,
        'required' => false,
        'multiple' => true,
        'attr' => [
        'class' => 'js-example-basic-single',
        ],
        ]) */
            ->add('minprice', IntegerType::class, [
                'required' => false,
                'label' => false,
                'attr' => [
                    'placeholder' => 'min ...',
                    'style' => 'width:120px',
                ],
            ])
            ->add('maxprice', IntegerType::class, [
                'required' => false,
                'label' => false,
                'attr' => [
                    'placeholder' => 'max ...',
                    'style' => 'width:120px',
                ],
            ])
           
            /*   ->add('tags', TextType::class, [
        'label' => false,
        'required'=> false,
        'attr' => [
        'placeholder' => 'tags ...'
        ]
        ]) */
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
