<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProductRepository;
use Doctrine\ORM\Query\Expr\Func;
use Symfony\Component\Stopwatch\Stopwatch;
use Symfony\Contracts\Cache\CacheInterface;

class HomeController extends AbstractController
{
    public function __construct(private ProductRepository $productRepository , private CategoryRepository $categoryRepository){

    }
    /**
     * @Route("/", name="home")
     */
    public function index(SessionInterface $session , Stopwatch $stopwatch , CacheInterface $cache )
    {
     /*    $stopwatch->start('calcul-long');
        $resultatCalculCache = $cache->get('calcul-long', function () {
            return $this->categorieMenu();
         });
         
         $stopwatch->stop('calcul-long'); */

        $categorie = $this->categoryRepository->findAll();
       // $products=$this->productRepository->findProduct();

        return $this->render('home/index.html.twig',
        [
            
            'products'=>$this->productRepository->findProduct(),
            'categorie' => $categorie ,
            
        ]);

    }


    /**
     * @Route("/categoriemenu", name="categorie_menu")
     */
    public function categorieMenu()
    {
        
        $categories = $this->categoryRepository->findAll();
       

        return $this->render('home/categorie_menu.html.twig', 

        ['categories' => $categories]);
        
    }

   
}
