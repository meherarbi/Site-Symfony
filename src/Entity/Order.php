<?php

namespace App\Entity;

use App\Entity\OrderDetails;
use App\Repository\OrderRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Events;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Persistence\Event\LifecycleEventArgs;

/**
 * @ORM\Entity(repositoryClass=OrderRepository::class)
 * @ORM\Table(name="`order`")
 */
class Order
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="orders")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $carrierName;

    /**
     * @ORM\Column(type="float")
     */
    private $carrierPrice;

    /**
     * @ORM\Column(type="text")
     */
    private $delivery;

    /**
     * @ORM\OneToMany(targetEntity=OrderDetails::class, mappedBy="myOrder", cascade={"persist"})
     */
    private $orderDetails;

    public function addOrderDetail(OrderDetails $orderDetail): self
    {
        if (!$this->orderDetails->contains($orderDetail)) {
            $this->orderDetails[] = $orderDetail;
            $orderDetail->setMyOrder($this);
        }

        return $this;
    }

    public function removeOrderDetail(OrderDetails $orderDetail): self
    {
        if ($this->orderDetails->removeElement($orderDetail)) {
            // set the owning side to null (unless already changed)
            if ($orderDetail->getMyOrder() === $this) {
                $orderDetail->setMyOrder(null);
            }
        }

        return $this;
    }

    public function addOrderDetails(array $orderDetails): self
    {
        foreach ($orderDetails as $orderDetail) {
            $this->addOrderDetail($orderDetail);
        }

        return $this;
    }

    /**
     * @ORM\Column(type="boolean")
     */
    private $isPaid;

    /**
     * @ORM\ManyToMany(targetEntity=Product::class, inversedBy="orders")
     */
    private $products;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $illustration;

    public function getProductIllustrations(): string
    {
        $illustrationUrls = [];
        foreach ($this->getOrderDetails() as $detail) {
            $product = $detail->getProduct();
            if ($product && $product->getIllustration()) {
                $illustrationUrls[] = '<img src="/uploads/' . $product->getIllustration() . '" style="max-height:100px">';
            }
        }
        $illustrationUrls = array_merge($illustrationUrls, $this->getIllustrationUrls());

        return implode('<br>', $illustrationUrls);
    }

    public function __construct()
    {
        $this->orderDetails = new ArrayCollection();
        $this->products = new ArrayCollection();
    }

    public function __toString()
{
    return (string) $this->getUser()->getId();
}


    public function getTotal()
    {
        $total = null;
        foreach ($this->getOrderDetails()->getValues() as $product) {
            $total = $total + ($product->getPrice() * $product->getQuantity());

        }
        return $total;
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface$createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getCarrierName(): ?string
    {
        return $this->carrierName;
    }

    public function setCarrierName(string $carrierName): self
    {
        $this->carrierName = $carrierName;

        return $this;
    }

    public function getCarrierPrice(): ?float
    {
        return $this->carrierPrice;
    }

    public function setCarrierPrice(float $carrierPrice): self
    {
        $this->carrierPrice = $carrierPrice;

        return $this;
    }

    public function getDelivery(): ?string
    {
        return $this->delivery;
    }

    public function setDelivery(string $delivery): self
    {
        $this->delivery = $delivery;

        return $this;
    }

    /**
     * @return Collection|OrderDetails[]
     */
    public function getOrderDetails(): Collection
    {
        return $this->orderDetails;
    }

    public function getIsPaid(): ?bool
    {
        return $this->isPaid;
    }

    public function setIsPaid(bool $isPaid): self
    {
        $this->isPaid = $isPaid;

        return $this;
    }

    public function cleanDelivery()
    {
        $this->delivery = strip_tags($this->delivery);
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $this->cleanDelivery();
    }

    public function getSubscribedEvents()
    {
        return [Events::prePersist];
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
            $product->addOrder($this);
        }

        return $this;
    }

    public function removeProduct(Product $product): self
    {
        if ($this->products->contains($product)) {
            $this->products->removeElement($product);
            $product->removeOrder($this);
        }

        return $this;
    }

    public function getIllustration(): ?array
    {
        if (!$this->illustration) {
            return null;
        }
    
        return json_decode($this->illustration, true, 512);

    }

    public function setIllustration(array $illustration)
    {
        $this->illustration = json_encode($illustration, JSON_THROW_ON_ERROR);
    }

    public function getIllustrationUrls(): array
    {
        $urls = [];

        if (!empty($this->illustration)) {
            $illustrations = unserialize($this->illustration);

            foreach ($illustrations as $illustration) {
                $urls[] = '/uploads/' . $illustration;
            }
        }

        return $urls;
    }

}
