<?php

namespace App\Form\DataTransformer;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\DataTransformerInterface;
use Symfony\Component\Form\Exception\TransformationFailedException;

class ProductsArrayToStringTransformer implements DataTransformerInterface
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * Transforms an array of products to a string of product IDs.
     *
     * @param Product[] $products
     * @return string
     */
    public function transform($products)
    {
        if (null === $products) {
            return '';
        }

        $productIds = [];

        foreach ($products as $product) {
            $productIds[] = $product->getId();
        }

        return implode(',', $productIds);
    }

    /**
     * Transforms a string of product IDs to an array of products.
     *
     * @param string $productIdsString
     * @return Product[]
     */
    public function reverseTransform($productIdsString)
    {
        if (!$productIdsString) {
            return [];
        }

        $productIds = explode(',', $productIdsString);
        $products = $this->entityManager->getRepository(Product::class)->findBy(['id' => $productIds]);

        if (!$products) {
            throw new TransformationFailedException(sprintf('Products with IDs "%s" do not exist!', $productIdsString));
        }

        return $products;
    }
}
