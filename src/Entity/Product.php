<?php

namespace App\Entity;

use App\Entity\ProductImage;
use App\Repository\ProductRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 *
 */
class Product
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     *
     */
    private $slug;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $illustration;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $subtitle;

    /**
     * @ORM\Column(type="string", length=5000)
     */
    private $description;

    /**
     * @ORM\Column(type="float")
     */
    private $price;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="products")
     * @ORM\JoinColumn(nullable=true)
     */
    private $category;

    /**
     * @ORM\OneToMany(targetEntity=RecentlyViewedProduct::class, mappedBy="product")
     */
    private $recentlyViewedProducts;

    /**
     * @ORM\ManyToMany(targetEntity=Order::class, mappedBy="products")
     */
    private $orders;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2, nullable=true,options={"default": 10})
     */
    private $oldPrice;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $onPromotion;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $imageFile;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProductImage", mappedBy="product", cascade={"persist"})
     */
    private $images;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $img;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descriptionImage;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $isDeal;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $isOnSale;

    /**
     * @ORM\Column(type="datetime_immutable", nullable=true)
     */
    private $createdAt;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getIllustration(): ?string
    {
        return $this->illustration;
    }

    public function setIllustration(string $illustration): self
    {
        $this->illustration = $illustration;

        return $this;
    }

    public function getSubtitle(): ?string
    {
        return $this->subtitle;
    }

    public function setSubtitle(string $subtitle): self
    {
        $this->subtitle = $subtitle;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    /**
     * @return Collection<int, RecentlyViewedProduct>
     */
    public function getRecentlyViewedProducts(): Collection
    {
        return $this->recentlyViewedProducts;
    }

    public function addRecentlyViewedProduct(RecentlyViewedProduct $recentlyViewedProduct): self
    {
        if (!$this->recentlyViewedProducts->contains($recentlyViewedProduct)) {
            $this->recentlyViewedProducts[] = $recentlyViewedProduct;
            $recentlyViewedProduct->setProduct($this);
        }

        return $this;
    }

    public function removeRecentlyViewedProduct(RecentlyViewedProduct $recentlyViewedProduct): self
    {
        if ($this->recentlyViewedProducts->removeElement($recentlyViewedProduct)) {
            // set the owning side to null (unless already changed)
            if ($recentlyViewedProduct->getProduct() === $this) {
                $recentlyViewedProduct->setProduct(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Order>
     */
    public function getOrders(): Collection
    {
        return $this->orders;
    }

    public function addOrder(Order $order): self
    {
        if (!$this->orders->contains($order)) {
            $this->orders[] = $order;
            $order->addProduct($this);
        }

        return $this;
    }

    public function removeOrder(Order $order): self
    {
        if ($this->orders->contains($order)) {
            $this->orders->removeElement($order);
            $order->removeProduct($this);
        }

        return $this;
    }

    public function getOldPrice(): ?string
    {
        return $this->oldPrice;
    }

    public function setOldPrice(?string $oldPrice): self
    {
        $this->oldPrice = $oldPrice;

        return $this;
    }

    public function getOnPromotion(): ?bool
    {
        return $this->onPromotion;
    }

    public function setOnPromotion(?bool $onPromotion): self
    {
        $this->onPromotion = $onPromotion;

        return $this;
    }

    public function getImageFile(): ?string
    {
        return $this->imageFile;
    }

    public function setImageFile(?string $imageFile): self
    {
        $this->imageFile = $imageFile;

        return $this;
    }

/*     public function getIllustration(): ?ProductImage
{
return $this->illustration;
}

public function setIllustration(?ProductImage $illustration): self
{
$this->illustration = $illustration;

return $this;
} */

/**
 * @return Collection<int, ProductImage>
 */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(ProductImage $image): self
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
            $image->setProduct($this);
        }

        return $this;
    }

    public function removeImage(ProductImage $image): self
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getProduct() === $this) {
                $image->setProduct(null);
            }
        }

        return $this;
    }

    public function getImg(): ?string
    {
        return $this->img;
    }

    public function setImg(?string $img): self
    {
        $this->img = $img;

        return $this;
    }

    public function getDescriptionImage(): ?string
    {
        return $this->descriptionImage;
    }

    public function setDescriptionImage(?string $descriptionImage): self
    {
        $this->descriptionImage = $descriptionImage;

        return $this;
    }

    public function getIsDeal(): ?bool
    {
        return $this->isDeal;
    }

    public function setIsDeal(?bool $isDeal): self
    {
        $this->isDeal = $isDeal;

        return $this;
    }

    public function getIsOnSale(): ?bool
    {
        return $this->isOnSale;
    }

    public function setIsOnSale(?bool $isOnSale): self
    {
        $this->isOnSale = $isOnSale;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTimeImmutable$createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->getId(),
            'name' => $this->getName(),
            'slug' => $this->getSlug(),
            'illustration' => $this->getIllustration(),
            'price' => $this->getPrice(),
            'oldPrice' => $this->getOldPrice(),
            'category' => [
                'id' => $this->getCategory()->getId(),
                'name' => $this->getCategory()->getName(),
            ],
        ];
    }

}
