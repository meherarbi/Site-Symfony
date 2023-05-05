<?php

namespace App\Service;

use Elastica\Document;
use Elastica\Query;
use Elastica\Query\QueryString;
use FOS\ElasticaBundle\Elastica\Client;
use FOS\ElasticaBundle\Finder\PaginatedFinderInterface;
use Knp\Component\Pager\Pagination\PaginationInterface;
use Knp\Component\Pager\PaginatorInterface;
use Elastica\Query\MultiMatch;

class ElasticsearchService
{
    private $client;
    private $productFinder;
    private $paginator;

    public function __construct(Client $client, PaginatedFinderInterface $productFinder, PaginatorInterface $paginator)
    {
        $this->client = $client;
        $this->productFinder = $productFinder;
        $this->paginator = $paginator;
    }

    /**
     * Create an Elasticsearch index with the given name.
     *
     * @param string $indexName
     * @return array
     */
/**
 * Create an Elasticsearch index with the given name.
 *
 * @param string $indexName The name of the Elasticsearch index to create
 * @return void
 */
    public function createIndex(string $indexName)
    {
        $index = $this->client->getIndex($indexName);

        if ($index->exists()) {
            $index->delete();
        }

        // Configurez votre mapping et vos paramètres d'index ici
        $settings = [
            'number_of_shards' => 3,
            'number_of_replicas' => 2,
        ];

        $index->create(['settings' => $settings]);
    }

/**
 * Index a document in the specified index with the given ID and data.
 *
 * @param string $indexName
 * @param string $id
 * @param array $data
 * @return array
 */
    public function indexDocument(string $indexName, string $id, array $data): void
    {
        $index = $this->client->getIndex($indexName);
        $document = new Document($id, $data);

        // Vous pouvez également gérer les erreurs ici si nécessaire
        $index->addDocuments([$document]);
        $index->refresh();
    }

    /**
     * Search documents in the specified index using the query.
     *
     * @param string $indexName
     * @param string $query
     * @return array
     */

     

     public function searchProducts(string $query, int $page = 1, int $limit = 8): PaginationInterface
     {
         $searchQuery = new MultiMatch();
         $searchQuery->setQuery($query);
         $searchQuery->setFields(['name']); // Ajoutez d'autres champs si nécessaire
     
         $search = new Query();
         $search->setQuery($searchQuery);
     
         $paginatorAdapter = $this->productFinder->createPaginatorAdapter($search);
     
         return $this->paginator->paginate($paginatorAdapter, $page, $limit);
     }
     

}
