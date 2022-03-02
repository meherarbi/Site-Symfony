<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class BaseController extends AbstractController
{
    public function __construct(private CategoryRepository $categoryRepository)
    {

    }

    public function index(): Response
    {
        $categorie = $this->categoryRepository->findAll();
        return $this->render('base.html.twig',
            [
                'categorie' => $categorie,
            ]);

    }
}
