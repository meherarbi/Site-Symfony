<?php

namespace App\Repository;

use App\Entity\Category;
use App\Entity\RecentlyViewedProduct;
use App\Entity\User;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<RecentlyViewedProduct>
 *
 * @method RecentlyViewedProduct|null find($id, $lockMode = null, $lockVersion = null)
 * @method RecentlyViewedProduct|null findOneBy(array $criteria, array $orderBy = null)
 * @method RecentlyViewedProduct[]    findAll()
 * @method RecentlyViewedProduct[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RecentlyViewedProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RecentlyViewedProduct::class);
    }

    public function getRecentlyViewedProductsForUser(int $userId)
    {
        return $this->createQueryBuilder('r')
            ->where('r.userId = :userId')
            ->setParameter('userId', $userId)
            ->getQuery()
            ->getResult();
    }

    public function findRecentlyViewedByUser(User $user)
    {
        return $this->createQueryBuilder('rvp')

            ->innerJoin('rvp.user', 'u')
            ->where('u = :user')
            ->setParameter('user', $user)
            ->getQuery()
            ->getResult();
    }

    public function findRecentlyViewedProductsByUser(User $user, DateTime $since, Category $category = null)
    {
        $queryBuilder = $this->createQueryBuilder('r')
            ->innerJoin('r.product', 'p')
            ->andWhere('r.user = :user')
            ->andWhere('r.viewedAt > :since')
            ->setParameter('user', $user)
            ->setParameter('since', $since);
    
        if ($category !== null) {
            $queryBuilder->andWhere('p.category = :category')
                ->setParameter('category', $category);
        }
    
        return $queryBuilder
            ->orderBy('r.viewedAt', 'DESC')
            ->getQuery()
            ->getResult();
    }
    
    public function findRecentlyViewedProductIdsByUser(User $user, DateTime $since): array
    {
        $qb = $this->createQueryBuilder('rvp')
            ->select('IDENTITY(rvp.product) as id')
            ->where('rvp.user = :user')
            ->andWhere('rvp.viewedAt >= :since')
            ->setParameter('user', $user)
            ->setParameter('since', $since);
    
        $result = $qb->getQuery()->getResult();
    
        return array_column($result, 'id');
    }
    

public function findRecentlyViewedProductsByProductIdsAndCategory(array $productIds, Category $category): array
{
    if (empty($productIds)) {
        return [];
    }

    $qb = $this->createQueryBuilder('p')
        ->where('p.id IN (:productIds)')
        ->andWhere('p.category = :category')
        ->setParameter('productIds', $productIds)
        ->setParameter('category', $category);

    return $qb->getQuery()->getResult();
}

    
    

    public function findByUser(User $user)
    {
        return $this->createQueryBuilder('rvp')
            ->where('rvp.user = :user')
            ->setParameter('user', $user)
            ->orderBy('rvp.id', 'DESC')
            ->getQuery()
            ->getResult();
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(RecentlyViewedProduct $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(RecentlyViewedProduct $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    // /**
    //  * @return RecentlyViewedProduct[] Returns an array of RecentlyViewedProduct objects
    //  */
    /*
    public function findByExampleField($value)
    {
    return $this->createQueryBuilder('r')
    ->andWhere('r.exampleField = :val')
    ->setParameter('val', $value)
    ->orderBy('r.id', 'ASC')
    ->setMaxResults(10)
    ->getQuery()
    ->getResult()
    ;
    }
     */

    /*
public function findOneBySomeField($value): ?RecentlyViewedProduct
{
return $this->createQueryBuilder('r')
->andWhere('r.exampleField = :val')
->setParameter('val', $value)
->getQuery()
->getOneOrNullResult()
;
}
 */
}
