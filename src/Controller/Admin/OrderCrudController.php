<?php

namespace App\Controller\Admin;

use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CountryField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use App\Service\OrderFieldProvider;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\HttpFoundation\RequestStack;

class OrderCrudController extends AbstractCrudController
{
    // inject the RequestStack service
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
   
    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->add('index','detail');
    }


    public function configureFields(string $pageName): iterable
{
    
   
    $fields = [
        IdField::new('id'),
        ImageField::new('orderDetails.product.illustration', 'Image')
            ->setBasePath('uploads/')
            ->setUploadDir('public/uploads/')
            ->setUploadedFileNamePattern('[randomhash].[extension]')
            ->setRequired(false),
            
        DateTimeField::new('createdAt', 'passer le'),
        MoneyField::new('total')->setCurrency('EUR'),
        BooleanField::new('isPaid', 'Payé'),
        TextField::new('delivery')->formatValue(function ($value) {
            return strip_tags($value);
        })
    ];
   
   
    if ($pageName === Crud::PAGE_INDEX || $pageName === Crud::PAGE_DETAIL) {
        $fields[] = TextField::new('user.fullName', 'Client')->formatValue(function ($value, $entity) {
            if ($entity->getUser() === null) {
                return 'Utilisateur inconnu';
            }
            return $entity->getUser()->getFullName();
        });
    }

    
    return $fields;
    
}

public function configureFilters(Filters $filters): Filters
{
    return $filters
        ->add('user')
        ->add('createdAt')
        ->add('isPaid');
}
    



}
