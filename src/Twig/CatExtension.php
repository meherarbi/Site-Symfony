<?php

namespace App\Twig;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class CatExtension extends AbstractExtension
{

    public function __construct(private EntityManagerInterface $em)
    {
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('cat', [$this, 'getCategories']),
        ];
    }

    public function getCategories()
    {
        return $this->em->getRepository(Category::class)->findBy([], ['name' => 'ASC']);
    }

}
