<?php
namespace App\Service;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart
{
    private $session;
    private $entityManager;
    private $productRepository;
    public function __construct(EntityManagerInterface $entityManager, SessionInterface $session,ProductRepository $productRepository)
    {
        $this->session = $session;
        $this->entityManager = $entityManager;
        $this->productRepository = $productRepository;

    }

    public function add($id, $size)
    {
        $cart = $this->session->get('cart', []);

        if (!isset($cart[$id])) {
            $cart[$id] = [
                'quantity' => 0,
                'size' => $size,
            ];
        }

        $cart[$id]['quantity']++;
        $cart[$id]['size'] = $size; // Assurez-vous que la taille est toujours à jour

        $this->session->set('cart', $cart);
    }

    public function decrease($slug)
    {
        $product = $this->productRepository->findOneBy(['slug' => $slug]);
        if (!$product) {
            // Gérer le cas où le produit n'est pas trouvé
            throw new \Exception("Product not found");
        }
    
        $id = $product->getId();
    
        $cart = $this->session->get('cart', []);
        if (isset($cart[$id]) && $cart[$id]['quantity'] > 1) {
            $cart[$id]['quantity']--;
        } else {
            unset($cart[$id]);
        }
        return $this->session->set('cart', $cart);
    }

    public function get()
    {
        return $this->session->get('cart');
    }

    public function remove()
    {
        return $this->session->remove('cart');
    }

    public function delete($id)
    {
        $cart = $this->session->get('cart', []);
        unset($cart[$id]);
        return $this->session->set('cart', $cart);
    }

   
    
    

    public function getFull()
    {
        $cartComplete = [];
        
        if ($this->get()) {
            foreach ($this->get() as $id => $quantity) {
               
                $product_object = $this->entityManager->getRepository(Product::class)->findOneById($id);
                
                if (!$product_object) {
                    $this->delete($id);
                    continue;
                }
                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity,
                ];
               /*  dd($cartComplete); */
            }}
        return $cartComplete;
    }

    // Dans votre service Cart

public function calculateTotal()
{
    $total = 0;

    foreach($this->session->get('cart', []) as $id => $details) {
        $product = $this->entityManager->getRepository(Product::class)->find($id);
        if (!$product) {
            continue; // Ignorez les produits non trouvés dans la base de données
        }

        $total += $product->getPrice() * $details['quantity'];
    }

    return $total;
}

public function updateQuantity($id, $action)
{
    $cart = $this->session->get('cart', []);

    if (!isset($cart[$id])) {
        return false; // Si le produit n'existe pas dans le panier, retournez false
    }

    if ($action === 'add') {
        $cart[$id]['quantity']++;
    } elseif ($action === 'remove' && $cart[$id]['quantity'] > 1) {
        $cart[$id]['quantity']--;
    }

    $this->session->set('cart', $cart);

    return true;
}

}
