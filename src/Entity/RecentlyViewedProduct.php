<?php

namespace App\Entity;

use App\Repository\RecentlyViewedProductRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=RecentlyViewedProductRepository::class)
 */
class RecentlyViewedProduct
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Product::class, inversedBy="recentlyViewedProducts")
     * @ORM\JoinColumn(name="product_id", referencedColumnName="id",nullable=false)
     */
    private $product;



    /**
     * @ORM\Column(type="datetime_immutable", nullable=true)
     */
    private $viewedAt;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="recentlyViewedProducts")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProduct(): ?Product
    {
        return $this->product;
    }

    public function setProduct(?Product $product): self
    {
        $this->product = $product;

        return $this;
    }

    public function getViewedAt(): ?\DateTimeImmutable
    {
        return $this->viewedAt;
    }

    public function setViewedAt(?\DateTimeImmutable$viewedAt): self
    {
        $this->viewedAt = $viewedAt;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function setUserId(int $userId)
    {
        $this->user= $userId;

        return $this;
    }

    
    public function setProductId(int $productId)
    {
        $this->product= $productId;

        return $this;
    }
}
