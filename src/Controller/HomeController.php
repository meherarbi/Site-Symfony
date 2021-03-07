<?php

namespace App\Controller;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(SessionInterface $session)
    {
        return $this->render('home/index.html.twig');
    }

    /**
     * @Route("/categoriemenu", name="categorie_menu")
     */
    public function categorieMenu(EntityManagerInterface $entityManager)
    {
        $categories = $entityManager->getRepository(\App\Entity\Category::class)->findAll();
        return $this->render('home/categorie_menu.html.twig', ['categories' => $categories]);
    }
}
