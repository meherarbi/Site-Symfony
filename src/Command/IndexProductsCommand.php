<?php

namespace App\Command;

use App\Entity\Product;
use App\Service\ElasticsearchService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

class IndexProductsCommand extends Command
{
    protected static $defaultName = 'app:index-products';
    private $entityManager;
    private $elasticsearchService;

    public function __construct(EntityManagerInterface $entityManager, ElasticsearchService $elasticsearchService)
    {
        $this->entityManager = $entityManager;
        $this->elasticsearchService = $elasticsearchService;
        parent::__construct();
    }

    protected function configure()
    {
        $this
            ->setDescription('Index all existing products in Elasticsearch');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        $products = $this->entityManager->getRepository(Product::class)->findAll();

        foreach ($products as $product) {
            $productData = [
                'name' => $product->getName(),
                'description' => $product->getDescription(),
                // Ajoutez les autres champs pertinents pour votre produit ici
            ];
            $this->elasticsearchService->indexDocument('products', $product->getId(), $productData);
        }

        $io->success('All existing products have been indexed in Elasticsearch.');

        return Command::SUCCESS;
    }
}
