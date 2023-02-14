<?php

namespace App\Controller\Admin;

use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class OrderCrudController extends AbstractCrudController
{

    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions->disable(Action::NEW , Action::DELETE);
    }

    public function configureFields(string $pageName): iterable
    {

        $fields = [
            IdField::new ('id'),
            ImageField::new ('illustration', 'Images')
                ->setBasePath('uploads/')
                ->setUploadDir('public/uploads/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            DateTimeField::new ('createdAt', 'Passer le'),
            MoneyField::new ('total')->setCurrency('EUR'),
            BooleanField::new ('isPaid', 'Payé'),
            TextField::new ('delivery')->formatValue(function ($value) {
                return strip_tags($value);
            }),

        ];

        return $fields;
    }
}
