<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;

class PriceFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('minPrice', NumberType::class, [
                'label' => 'Min Price',
                'required' => false,
            ])
            ->add('maxPrice', NumberType::class, [
                'label' => 'Max Price',
                'required' => false,
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Filter',
                'attr' => ['class' => 'normal-btn']
            ]);
    }
}
