<?php

namespace App\Controller;


use App\Entity\Category;
use App\Entity\FormInput;
use App\Entity\Item;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Contracts\Translation\TranslatorInterface;

class BaseController extends AbstractController
{
    private $entityManager;

    private $translator;

    public function __construct(EntityManagerInterface $entityManager, TranslatorInterface $translator)
    {
        $this->entityManager = $entityManager;
        $this->translator = $translator;
    }

    public function baseAction(Request $request)
    {
        $formData = new FormInput();
        $categories = $this->entityManager->getRepository(Category::class)->findAll();

        $form = $this->createFormBuilder($formData, ['data_class' => FormInput::class])
            ->add('name', TextType::class, [
                'constraints' => [
                    new NotBlank([
                        'message' => $this->translator->trans('empty.field')
                    ])
                ]
            ])
            ->add('item', ChoiceType::class, [
                'placeholder' => 'pick the Sector',
                'choices' => $this->getChoices($categories),
                'constraints' => [
                    new NotBlank([
                        'message' => $this->translator->trans('empty.field')
                    ])
                ]
            ])
            ->add('termsAgreed', CheckboxType::class, [
                'constraints' => [
                    new IsTrue([
                        'message' => $this->translator->trans('empty.terms')
                    ])
                ]
            ])
            ->add('save', SubmitType::class, ['label' => 'Save'])
            ->getForm();


        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = ($form->getData());
            $this->entityManager->persist($data);
            $this->entityManager->flush();
        }

        return $this->render('selector/selector.html.twig', [
            'form' => $form->createView()
        ]);
    }

    private function getChoices($categories)
    {
        $choices = [];
        /** @var Category $category */
        foreach ($categories as $category) {
            $choices[$category->getName()] = $category->getItemBundle() ? $this->getItems($category) : '';
        }

        return $choices;
    }

    private function getItems(Category $category)
    {
        $arr = [];
        /** @var Item $item */
        $items = $category->getItemBundle()->getItems();
        foreach ($items as $item) {
            $arr[$item->getname()] = $item;
        }

        return $arr;
    }
}