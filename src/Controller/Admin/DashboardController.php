<?php

namespace App\Controller\Admin;

use App\Entity\Carrier;
use App\Entity\Category;
use App\Entity\Order;
use App\Entity\OrderDetails;
use App\Entity\Product;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
{
    // Vérifiez si l'utilisateur actuel a le rôle 'ROLE_ADMIN'
    if (!$this->isGranted('ROLE_ADMIN')) {
        // Si l'utilisateur n'a pas le rôle 'ROLE_ADMIN', redirigez-le vers une page d'authentification
        return $this->redirectToRoute('app_login');
    }

    // Si l'utilisateur a le rôle 'ROLE_ADMIN', générez l'URL du contrôleur 'OrderCrudController'
    $routeBuilder = $this->get(AdminUrlGenerator::class);
    $url = $routeBuilder->setController(OrderCrudController::class)->generateUrl();

    // Redirigez l'utilisateur vers l'URL générée
    return $this->redirect($url);
}


    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('My Store');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('User', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Orders', 'fas fa-shopping-cart', Order::class);
        yield MenuItem::linkToCrud('Category', 'fas fa-list', Category::class);
        yield MenuItem::linkToCrud('Products', 'fas fa-tag', Product::class);
        yield MenuItem::linkToCrud('Carriers', 'fas fa-truck', Carrier::class);
        yield MenuItem::linkToCrud('Carriers', 'fas fa-shopping-cart', OrderDetails::class);
    }
}
