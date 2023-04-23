<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SitemapController extends AbstractController
{
    private $productRepository;

    public function __construct(ProductRepository $productRepository, PaginatorInterface $paginator)
    {
        $this->productRepository = $productRepository;
    }

    #[Route('/sitemap.xml', name:'app_sitemap', defaults:['_format' => 'xml'])]
function index(Request $request)
    {
    // Nous récupérons le nom d'hôte depuis l'URL
    $hostname = $request->getSchemeAndHttpHost();

    // création du document XML
    $xml = new \XMLWriter();
    $xml->openMemory();
    $xml->setIndent(true);
    $xml->startDocument('1.0', 'UTF-8');
   

    $xml->startElement('urlset');
    $xml->writeAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
    $xml->writeAttribute('xmlns:xhtml', 'http://www.w3.org/1999/xhtml');
    $xml->writeAttribute('xmlns:image', 'http://www.google.com/schemas/sitemap-image/1.1');
    $xml->writeAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
    $xml->writeAttribute('xsi:schemaLocation', 'http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd');

    $products = 
        $this->productRepository->findAll();

        foreach ($products as $product) {
            // récupérer l'URL de base à partir de la requête
            $base_url = $request->getSchemeAndHttpHost();
        
            // construire l'URL complète du produit
            $product_url = $base_url.'/products/'.$product->getSlug();
        
            $images = [
                'loc' => $hostname.'/uploads/'.$product->getIllustration(), // URL to image
                'title' => $product->getName()    // Optional, text describing the image
            ];
            $url = [
                'loc' => $product_url,
                'image' => $images
            ];
            $xml->startElement('url');
            $xml->writeElement('loc', $url['loc']);
            $xml->startElement('image:image');
            $xml->writeElement('image:loc', $url['image']['loc']);
            $xml->writeElement('image:title', $url['image']['title']);
            $xml->endElement(); // ferme l'élément 'image'
            $xml->writeElement('changefreq', 'weekly');
            $xml->writeElement('priority', '0.5');
            $xml->endElement(); // ferme l'élément 'url'
        }
        
        

    $xml->endElement(); // ferme l'élément 'urlset'
    $xml->endDocument();

    $response = new Response(
        $xml->outputMemory(),
        200
    );
    $response->headers->set('Content-Type', 'text/xml');

    return $response;
}

}
