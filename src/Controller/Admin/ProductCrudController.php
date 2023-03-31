<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use App\Service\ElasticsearchService;



class ProductCrudController extends AbstractCrudController
{
    private $elasticsearchService;
    private $entityManager;

    public function __construct(ElasticsearchService $elasticsearchService , EntityManagerInterface $entityManager)
    {
        $this->elasticsearchService = $elasticsearchService;
        $this->entityManager = $entityManager;
    }
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name'),
            SlugField::new('slug')->setTargetFieldName('name'),
            ImageField::new('illustration')
                ->setBasePath('uploads/')
                ->setUploadDir('public/uploads/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired( false),
            TextField::new('subtitle'),
            TextareaField::new('description'),
            MoneyField::new('price')->setCurrency('EUR'),
            AssociationField::new('category')
        ];
    }

    public function persistEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        parent::persistEntity($entityManager, $entityInstance);
    
        // Indexer le produit dans Elasticsearch
        $productData = [
            'name' => $entityInstance->getName(),
            'description' => $entityInstance->getDescription(),
            // Ajoutez ici d'autres champs pertinents pour votre produit
        ];
        $this->elasticsearchService->indexDocument('products', $entityInstance->getId(), $productData);
    }
    


    public function updateEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        parent::updateEntity($entityManager, $entityInstance);

        // Update the product in Elasticsearch
        $productData = [
            'name' => $entityInstance->getName(),
            'description' => $entityInstance->getDescription(),
            // Add other relevant fields for your product here
        ];
        $this->elasticsearchService->indexDocument('products', $entityInstance->getId(), $productData);
    }
    
    
}



