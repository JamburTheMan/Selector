<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ItemRepository")
 */
class Item
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\ItemBundle", inversedBy="$item", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $itemBundle;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\FormInput", mappedBy="item", orphanRemoval=true)
     */
    private $formInputs;

    public function __construct()
    {
        $this->formInputs = new ArrayCollection();
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

    public function getItemBundle(): ?ItemBundle
    {
        return $this->itemBundle;
    }

    public function setItemBundle(?ItemBundle $itemBundle): self
    {
        $this->itemBundle = $itemBundle;

        return $this;
    }

    /**
     * @return Collection|FormInput[]
     */
    public function getFormInputs(): Collection
    {
        return $this->formInputs;
    }

    public function addFormInput(FormInput $formInput): self
    {
        if (!$this->formInputs->contains($formInput)) {
            $this->formInputs[] = $formInput;
            $formInput->setItem($this);
        }

        return $this;
    }

    public function removeFormInput(FormInput $formInput): self
    {
        if ($this->formInputs->contains($formInput)) {
            $this->formInputs->removeElement($formInput);
            // set the owning side to null (unless already changed)
            if ($formInput->getItem() === $this) {
                $formInput->setItem(null);
            }
        }

        return $this;
    }
}
