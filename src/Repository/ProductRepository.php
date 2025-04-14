<?php

namespace App\Repository;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\SearchProduct;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Contracts\Cache\CacheInterface;
use Symfony\Contracts\Cache\ItemInterface;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    private $cache;
    public function __construct(ManagerRegistry $registry , CacheInterface $cache)
    {
        parent::__construct($registry, Product::class);
        $this->cache = $cache;
    }

    /**
     * @return Product[] Returns an array of Product objects
     */

    public function findProduct()
    {
        return $this->cache->get('all_products', function (ItemInterface $item) {
            $item->expiresAfter(3600); // Cache pendant 1 heure
        return $this->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC')
            ->setMaxResults(6)
            ->getQuery()
            ->getResult()
        ;
    });
    }

    

    public function findLatestProductsByCategory($categoryId, $limit = 3)
    {
        return $this->cache->get('latest_products_' . $categoryId, function (ItemInterface $item) use ($categoryId, $limit) {
            $item->expiresAfter(3600); // Cache pendant 1 heure
        return $this->createQueryBuilder('p')
            ->andWhere('p.category = :categoryId')
            ->setParameter('categoryId', $categoryId)
            ->setMaxResults($limit)
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult();
        });
    }

    public function findByPriceRangeQueryBuilder($minPrice, $maxPrice)
    {

        $cacheKey = 'products_price_' . $minPrice . '_' . $maxPrice;

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($minPrice, $maxPrice) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

        $queryBuilder = $this->createQueryBuilder('p');

        if ($minPrice !== null) {
            $queryBuilder->andWhere('p.price >= :minPrice')
                ->setParameter('minPrice', $minPrice);
        }

        if ($maxPrice !== null) {
            $queryBuilder->andWhere('p.price <= :maxPrice')
                ->setParameter('maxPrice', $maxPrice);
        }

        return $queryBuilder;
    });
    }

    public function findProductMin()
    {
        return $this->cache->get('product_min', function (ItemInterface $item) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('p')
                ->orderBy('p.id', 'DESC')
                ->setMaxResults(3)
                ->getQuery()
                ->getResult();
        });
    }

    public function findProductASC()
    {
        return $this->cache->get('product_asc', function (ItemInterface $item) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('p')
                ->orderBy('p.id', 'ASC')
                ->setMaxResults(6)
                ->getQuery()
                ->getResult();
        });
    }

    public function findPromotedProducts()
    {
        return $this->cache->get('promoted_products', function (ItemInterface $item) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('p')
                ->andWhere('p.onPromotion = :val')
                ->setParameter('val', true)
                ->getQuery()
                ->getResult();
        });
    }

    public function findPromotedProductsByCategory($categoryId)
    {
        $cacheKey = 'promoted_products_category_' . $categoryId;

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($categoryId) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('p')
                ->andWhere('p.onPromotion = :val')
                ->andWhere('p.category = :categoryId')
                ->setParameter('val', true)
                ->setParameter('categoryId', $categoryId)
                ->getQuery()
                ->getResult();
        });
    }

    public function findRandomProducts(int $limit): array
    {
        $cacheKey = 'random_products_' . $limit;

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($limit) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('p')
                ->orderBy('RAND()')
                ->setMaxResults($limit)
                ->getQuery()
                ->getResult();
        });
    }
    public function findProductByCategory(): array
    {
        return $this->cache->get('products_by_category', function (ItemInterface $item) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            $entityManager = $this->getEntityManager();

            $query = $entityManager->createQuery('
                SELECT p FROM App\Entity\Product p
                WHERE p.id IN (
                    SELECT MIN(p2.id)
                    FROM App\Entity\Product p2
                    GROUP BY p2.category
                )
                ORDER BY p.category
            ');

            return $query->getResult();
        });
    }

    /*    public function findByCategory()
    {
    return $this->createQueryBuilder('p')
    ->select('c.name as category, p.name ,p.slug,')
    ->join('p.category', 'c')
    ->groupBy('c.name')
    ->getQuery()
    ->getResult();
    } */

/*
public function findProductsGroupByCategory($Id = null)
{
if (!$Id) {
return $this->findAll();
}

return $this->createQueryBuilder('p')
->join('p.category', 'c')
->where('c.id = :id')
->setParameter('id', $Id)
->getQuery()
->getResult();
}

 */
public function findAllWithCategory()
{
    return $this->cache->get('products_with_category', function (ItemInterface $item) {
        $item->expiresAfter(3600); // Cache pendant 1 heure

        return $this->createQueryBuilder('p')
            ->leftJoin('p.category', 'c')
            ->addSelect('c')
            ->getQuery()
            ->getResult();
    });
}

public function findProductsGroupByCategory($categoryId)
{
    $cacheKey = 'products_group_category_' . $categoryId;

    return $this->cache->get($cacheKey, function (ItemInterface $item) use ($categoryId) {
        $item->expiresAfter(3600); // Cache pendant 1 heure

        $qb = $this->createQueryBuilder('p')
            ->join('p.category', 'c')
            ->where('c.id = :categoryId')
            ->setParameter('categoryId', $categoryId)
            ->getQuery();

        return $qb->getResult();
    });
}


    /*  *
     * @return Product[] Returns an array of Product objects
     */
    /*   public function findByCategory(string $category): array
    {
    return $this->createQueryBuilder('p')
    ->andWhere('p.category = :category')
    ->setParameter('category', $category)
    ->getQuery()
    ->getResult()
    ;
    } */

  /**
     * @return Product[] Returns an array of Product objects
     */
    public function findWithSearch($search, $category)
    {
        $cacheKey = 'search_category_' . $category->getId() . '_min_' . $search->getMinPrice() . '_max_' . $search->getMaxPrice();

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($search, $category) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            $query = $this->createQueryBuilder('p');
            if ($search->getMinPrice()) {
                $query = $query->andWhere('p.price >= ' . $search->getMinPrice() * 100);
            }

            if ($search->getMaxPrice()) {
                $query = $query->andWhere('p.price <= ' . $search->getMaxPrice() * 100);
            }

            $query = $query->join('p.category', 'c')
                ->andWhere('c.id = :category')
                ->setParameter('category', $category->getId());

            return $query->getQuery()->getResult();
        });
    }

    public function findWithSearchNoCategory(SearchProduct $search)
    {
        $cacheKey = 'search_no_category_min_' . $search->getMinPrice() . '_max_' . $search->getMaxPrice();

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($search) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            $query = $this->createQueryBuilder('p');

            if ($search->getMinPrice()) {
                $query = $query->andWhere('p.price >= :minPrice')
                    ->setParameter('minPrice', $search->getMinPrice() * 100);
            }

            if ($search->getMaxPrice()) {
                $query = $query->andWhere('p.price <= :maxPrice')
                    ->setParameter('maxPrice', $search->getMaxPrice() * 100);
            }

            return $query->getQuery()->getResult();
        });
    }

    public function findRecentlyViewedByUser(User $user)
    {
        $cacheKey = 'recently_viewed_products_' . $user->getId();

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($user) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            return $this->createQueryBuilder('recently_viewed_product')
                ->select('product')
                ->join('recently_viewed_product.product', 'product')
                ->where('recently_viewed_product.user = :user')
                ->setParameter('user', $user)
                ->getQuery()
                ->getResult();
        });
    }


    public function findRecentlyViewedProductsByProductIdsAndCategory(array $productIds, Category $category): array
    {
        if (empty($productIds)) {
            return [];
        }

        $cacheKey = 'recently_viewed_products_category_' . $category->getId() . '_product_ids_' . implode('_', $productIds);

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($productIds, $category) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            $qb = $this->createQueryBuilder('p')
                ->where('p.id IN (:productIds)')
                ->andWhere('p.category = :category')
                ->setParameter('productIds', $productIds)
                ->setParameter('category', $category);

            return $qb->getQuery()->getResult();
        });
    }


   /**
     * @return Product[] Returns an array of Product objects
     */
    public function findWithSearchSelectCategory($search)
    {
        $cacheKey = 'search_select_category_min_' . $search->getMinPrice() . '_max_' . $search->getMaxPrice() . '_categories_' . implode('_', $search->getCategories());

        return $this->cache->get($cacheKey, function (ItemInterface $item) use ($search) {
            $item->expiresAfter(3600); // Cache pendant 1 heure

            $query = $this->createQueryBuilder('p');

            if ($search->getMinPrice()) {
                $query = $query->andWhere('p.price >= ' . $search->getMinPrice() * 100);
            }

            if ($search->getMaxPrice()) {
                $query = $query->andWhere('p.price <= ' . $search->getMaxPrice() * 100);
            }

            /*  //tags
            if($search->getTags()){
            $query = $query->andWhere('p.tags like :val')
            ->setParameter('val', "%{$search->getTags()}%");
            } */

            //Categories
            if ($search->getCategories()) {
                $query = $query->join('p.category', 'c')
                    ->andWhere('c.id IN (:categories)')
                    ->setParameter('categories', $search->getCategories());
            }
            return $query->getQuery()->getResult();
        });
    }


    // /**
    //  * @return Product[] Returns an array of Product objects
    //  */
    /*
    public function findByExampleField($value)
    {
    return $this->createQueryBuilder('p')
    ->andWhere('p.exampleField = :val')
    ->setParameter('val', $value)
    ->orderBy('p.id', 'ASC')
    ->setMaxResults(10)
    ->getQuery()
    ->getResult()
    ;
    }
     */

    /*
public function findOneBySomeField($value): ?Product
{
return $this->createQueryBuilder('p')
->andWhere('p.exampleField = :val')
->setParameter('val', $value)
->getQuery()
->getOneOrNullResult()
;
}
 */
}
