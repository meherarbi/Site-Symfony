<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use App\Entity\Color;
use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Assets;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class ColorCrudController extends AbstractCrudController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public static function getEntityFqcn(): string
    {
        return Color::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('category')
                ->setFormTypeOptions([
                    'attr' => ['class' => 'category-select'],
                ]),

            AssociationField::new('products')
                ->setFormTypeOptions([
                    'attr' => ['class' => 'product-select'],
                ]),
            
            TextField::new('name'),
            ImageField::new('image', 'Image')
                ->setBasePath('uploads/')
                ->setUploadDir('public/uploads/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
        ];
    }

    public function configureAssets(Assets $assets): Assets
    {
        return $assets
            ->addJsFile('https://code.jquery.com/jquery-3.6.0.min.js')
            ->addHtmlContentToBody('
                <script>
                    $(document).ready(function() {
                        var $category = $("#Color_category");
                        var $products = $("#Color_products");
                        console.log("tst");
                        console.log("dsds"+ $category);

                        $category.click(function() {
                            console.log($(this.val());
                            var categoryId = $(this).val();
                            $products.empty();
                            $products.select2(
                                let data = null ;
                                $.ajax({
                                url: "/admin/ajax/products/" + categoryId,
                                success: function(result) {
                                    console.log(data);
                                    data =  result;  
                                    console.log(data);
                                }
                            });
                        })
                        type: "select2:select",
                        params: {
                            data: data
                        });
                    });
                </script>
            ');
    }
    
  
}

