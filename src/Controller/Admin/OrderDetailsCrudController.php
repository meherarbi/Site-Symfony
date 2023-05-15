<?php

namespace App\Controller\Admin;

use App\Entity\OrderDetails;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class OrderDetailsCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return OrderDetails::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->add('index', 'detail');
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new ('product.name', 'Name'),
            ImageField::new ('illustration')
                ->setBasePath('uploads/')
                ->setUploadDir('public/uploads/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            MoneyField::new ('price')->setCurrency('EUR'),
            IntegerField::new ('myOrder.id')->setLabel('Order ID'),
            TextField::new ('myOrder.user.email')->setLabel('User Email'),
            DateTimeField::new ('myOrder.createdAt', 'Passer le'),
            TextField::new ('myOrder.delivery')->setLabel('Adresse')->formatValue(function ($value) {
                return strip_tags($value);
            }),
            TextField::new ('sizes.name')->setLabel('Sizes'),

        ];

    }

}
