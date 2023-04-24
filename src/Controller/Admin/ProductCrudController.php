<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use App\Service\ElasticsearchService;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\FormField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Form\Util\FormTab;
use Psr\Log\LoggerInterface;

class ProductCrudController extends AbstractCrudController
{
    private $elasticsearchService;
    private $entityManager;
    private $logger;

    public function __construct(ElasticsearchService $elasticsearchService, EntityManagerInterface $entityManager, LoggerInterface $logger)
    {
        $this->elasticsearchService = $elasticsearchService;
        $this->entityManager = $entityManager;
        $this->logger = $logger ;
    }

    public static function getEntityFqcn(): string
    {
        return Product::class;
    }


    public function configureFields(string $pageName): iterable
{
    return [
        FormField::addPanel('Détails du produit')->setIcon('fas fa-info-circle'),
            TextField::new('name')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
            SlugField::new('slug')->setTargetFieldName('name')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
            TextField::new('subtitle')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
            TextareaField::new('description')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
            AssociationField::new('category')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
            FormField::addPanel('Prix et promotion')->setIcon('fas fa-dollar-sign'),
        MoneyField::new('price')->setCurrency('EUR')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
        MoneyField::new('oldprice')->setCurrency('EUR')->setFormTypeOptions(['attr' => ['class' => 'col-md-6']]),
        BooleanField::new('onPromotion', 'En promotion')->setFormTypeOptions(['attr' => ['class' => 'col-md-4']]),
        BooleanField::new('isDeal', 'Deal of the week')->setFormTypeOptions(['attr' => ['class' => 'col-md-4']]),
        BooleanField::new('isOnSale', 'Sale Products')->setFormTypeOptions(['attr' => ['class' => 'col-md-4']]),
        FormField::addPanel('Images')->setIcon('fas fa-image'),
        ImageField::new('illustration')
                    ->setBasePath('uploads/')
                    ->setUploadDir('public/uploads/')
                    ->setUploadedFileNamePattern('[randomhash].[extension]')
                    ->setRequired(false),
        ImageField::new('imageFile', 'Images 1')
                    ->setBasePath('uploads/')
                    ->setUploadDir('public/uploads/')
                    ->setUploadedFileNamePattern('[randomhash].[extension]')
                    ->setRequired(false),
        ImageField::new('img', 'Images 2')
                    ->setBasePath('uploads/')
                    ->setUploadDir('public/uploads/')
                    ->setUploadedFileNamePattern('[randomhash].[extension]')
                    ->setRequired(false),
        ImageField::new('descriptionImage', 'Images de description')
                ->setBasePath('uploads/')
                ->setUploadDir('public/uploads/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false)
    ];
}

}    