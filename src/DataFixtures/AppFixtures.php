<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

use Faker\Factory;
use Faker\Generator;
use Symfony\Component\HttpFoundation\File\File;

class AppFixtures extends Fixture
{
    private Generator $faker;
 
    public function __construct()
    {
        $this->faker = Factory::create('fr_FR');   
        
       
       
    }
    public function load(ObjectManager $manager): void
    {
        
        
        $product = [];
          for ($i = 0; $i < 5; $i++) {
              $category = new Category();
              $category->setName($this->faker->word());
              $manager->persist($category);
          }

        for ($i = 0; $i < 10; $i++)
        {
            $product[$i] = new Product();
            $product[$i]->setName($this->faker->word())  
                    ->setPrice(mt_rand(5, 200))
                    ->setSlug($this->faker->uuid())
                    ->setSubtitle($this->faker->word())
                    ->setIllustration ("a.jpg")   
                    ->setDescription($this->faker->paragraph());
            
            $manager->persist($product[$i]);
        }
         

        $manager->flush();
    }
}
