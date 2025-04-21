<?php

namespace App\Entity;

use App\Repository\ColorRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ColorRepository::class)
 */
class Color
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    /**
     * @ORM\ManyToMany(targetEntity=Product::class, inversedBy="colors")
     */
    private $products;

    /**
     * @ORM\OneToMany(targetEntity=orderDetails::class, mappedBy="color")
     */
    private $orderDetails;

    public function __construct()
    {
        $this->products = new ArrayCollection();
        $this->orderDetails = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    /**
     * @return Collection<int, Product>
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function addProduct(Product $product): self
    {
        if (!$this->products->contains($product)) {
            $this->products[] = $product;
        }

        return $this;
    }

    public function removeProduct(Product $product): self
    {
        $this->products->removeElement($product);

        return $this;
    }

    /**
     * @return Collection<int, orderDetails>
     */
    public function getOrderDetails(): Collection
    {
        return $this->orderDetails;
    }

    public function addOrderDetail(orderDetails $orderDetail): self
    {
        if (!$this->orderDetails->contains($orderDetail)) {
            $this->orderDetails[] = $orderDetail;
            $orderDetail->setColor($this);
        }

        return $this;
    }

    public function removeOrderDetail(orderDetails $orderDetail): self
    {
        if ($this->orderDetails->removeElement($orderDetail)) {
            // set the owning side to null (unless already changed)
            if ($orderDetail->getColor() === $this) {
                $orderDetail->setColor(null);
            }
        }

        return $this;
    }
}
