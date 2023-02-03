<?php

namespace App\Form;

use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;

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
