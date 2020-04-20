<?php


namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ItemBundleRepository")
 */
class ItemBundle
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    protected $id;


    /**
     * @ORM\OneToMany(targetEntity="Item", mappedBy="itemBundle")
     */
    private $items;

    public function __construct()
    {
        $this->items = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection|Item[]
     */
    public function getItems(): Collection
    {
        return $this->items;
    }

    public function addItem(Item $bundleItem): self
    {
        if (!$this->items->contains($bundleItem)) {
            $this->items[] = $bundleItem;
            $bundleItem->setItemBundle($this);
        }

        return $this;
    }

    public function removeItem(Item $bundleItem): self
    {
        if ($this->items->contains($bundleItem)) {
            $this->items->removeElement($bundleItem);
            // set the owning side to null (unless already changed)
            if ($bundleItem->getItemBundle() === $this) {
                $bundleItem->setItemBundle(null);
            }
        }

        return $this;
    }
}