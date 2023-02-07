<?php

namespace App\Repository;

use App\Entity\User;
use App\Entity\Product;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    /**
     * @return Product[] Returns an array of Product objects
     */

    public function findProduct()
    {
        return $this->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC')
            ->setMaxResults(6)
            ->getQuery()
            ->getResult()
        ;
    }
    public function findProductMin()
    {
        return $this->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC')
            ->setMaxResults(3)
            ->getQuery()
            ->getResult()
        ;
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
        return $this->createQueryBuilder('p')
            ->leftJoin('p.category', 'c')
            ->addSelect('c')
            ->getQuery()
            ->getResult();
    }

    public function findProductsGroupByCategory($categoryId)
    {
        $qb = $this->createQueryBuilder('p')
            ->join('p.category', 'c')
            ->where('c.id = :categoryId')
            ->setParameter('categoryId', $categoryId)
            ->getQuery();

        return $qb->getResult();
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
    }



    public function findRecentlyViewedByUser(User $user)
{
    return $this->createQueryBuilder('recently_viewed_product')
        ->select('product')
        ->join('recently_viewed_product.product', 'product')
        ->where('recently_viewed_product.user = :user')
        ->setParameter('user', $user)
        ->getQuery()
        ->getResult();
}



     /**
     * @return Product[] Returns an array of Product objects
     */
    public function findWithSearchSelectCategory($search)
    {
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
