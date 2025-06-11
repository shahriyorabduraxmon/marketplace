import 'package:marketplace/assets/app_images.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class HomeController {
  List<ProductEntity> productList = [
    ProductEntity(
      id: 1,
      image: AppImages.limonFresh,
      name: "Laimon Fresh 0.25 l",
      price: 8000,
      description: "Laimon Fresh 0.25 l is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.25-liter can.",
      category: "Drink"
    ),
    ProductEntity(
        id: 2,
        image: AppImages.iceTea,
        name: "Ice Tea 0.25 l",
        price: 8000,
        description: "Ice Tea 0.25 L is a smooth and refreshing beverage made with real tea extract and a touch of natural fruit flavor. Served chilled, it offers the perfect balance of sweetness and freshness, making it an ideal drink for warm days or a quick break. Conveniently packed in a 0.25-liter can, it's your go-to choice for on-the-go refreshment.",
        category: "Drink"
    ),
    ProductEntity(
        id: 3,
        image: AppImages.iceTeaFructe,
        name: "Ice Tea Fruity 0.25 l",
        price: 10000,
        description: "Ice Tea Fruity 0.25 L is a deliciously refreshing iced tea infused with a blend of natural fruit flavors. Combining the smooth taste of real tea with fruity sweetness, it delivers a light and invigorating experience in every sip. Ideal for enjoying on the go, this 0.25-liter can is perfect for staying cool and refreshed anytime, anywhere.",
        category: "Drink"
    ),
    ProductEntity(
        id: 4,
        image: AppImages.limonTea,
        name: "Laimon Tea 0.25 l",
        price: 8000,
        description: "Laimon Tea 0.25 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.25-liter can.",
        category: "Drink"
    ),
    ProductEntity(
        id: 5,
        image: AppImages.moxito,
        name: "Moxito 0.25 l",
        price: 10000,
        description: "Moxito 0.25 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.25-liter can.",
        category: "Drink"
    ),

    ProductEntity(
        id: 6,
        image: AppImages.limonFresh,
        name: "Laimon Fresh 0.33 l",
        price: 10000,
        description: "Laimon Fresh 0.33L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.33-liter can.",
        category: "Drink"
    ),
    ProductEntity(
        id: 7,
        image: AppImages.iceTea,
        name: "Ice Tea 0.33 l",
        price: 10000,
        description: "Ice Tea 0.33 L is a smooth and refreshing beverage made with real tea extract and a touch of natural fruit flavor. Served chilled, it offers the perfect balance of sweetness and freshness, making it an ideal drink for warm days or a quick break. Conveniently packed in a 0.33-liter can, it's your go-to choice for on-the-go refreshment.",
        category: "Drink"
    ),
    ProductEntity(
        id: 8,
        image: AppImages.iceTeaFructe,
        name: "Ice Tea Fruity 0.33 l",
        price: 12000,
        description: "Ice Tea Fruity 0.33 L is a deliciously refreshing iced tea infused with a blend of natural fruit flavors. Combining the smooth taste of real tea with fruity sweetness, it delivers a light and invigorating experience in every sip. Ideal for enjoying on the go, this 0.33-liter can is perfect for staying cool and refreshed anytime, anywhere.",
        category: "Drink"
    ),
    ProductEntity(
        id: 9,
        image: AppImages.limonTea,
        name: "Laimon Tea 0.33 l",
        price: 10000,
        description: "Laimon Tea 0.33 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.33-liter can.",
        category: "Drink"
    ),
    ProductEntity(
        id: 10,
        image: AppImages.moxito,
        name: "Moxito 0.33 l",
        price: 12000,
        description: "Moxito 0.33 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.33-liter can.",
        category: "Drink"
    ),

    ProductEntity(
        id: 11,
        image: AppImages.limonFresh,
        name: "Laimon Fresh 0.5 l",
        price: 12000,
        description: "Laimon Fresh 0.5 l is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.5-liter can.",
        category: "Drink"
    ),
    ProductEntity(
        id: 12,
        image: AppImages.iceTea,
        name: "Ice Tea 0.5 l",
        price: 12000,
        description: "Ice Tea 0.5 L is a smooth and refreshing beverage made with real tea extract and a touch of natural fruit flavor. Served chilled, it offers the perfect balance of sweetness and freshness, making it an ideal drink for warm days or a quick break. Conveniently packed in a 0.5-liter can, it's your go-to choice for on-the-go refreshment.",
        category: "Drink"
    ),
    ProductEntity(
        id: 13,
        image: AppImages.iceTeaFructe,
        name: "Ice Tea Fruity 0.5 l",
        price: 15000,
        description: "Ice Tea Fruity 0.5 L is a deliciously refreshing iced tea infused with a blend of natural fruit flavors. Combining the smooth taste of real tea with fruity sweetness, it delivers a light and invigorating experience in every sip. Ideal for enjoying on the go, this 0.5-liter can is perfect for staying cool and refreshed anytime, anywhere.",
        category: "Drink"
    ),
    ProductEntity(
        id: 14,
        image: AppImages.limonTea,
        name: "Laimon Tea 0.5 l",
        price: 12000,
        description: "Laimon Tea 0.5 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.5-liter can.",
        category: "Drink"
    ),
    ProductEntity(
        id: 15,
        image: AppImages.moxito,
        name: "Moxito 0.5 l",
        price: 15000,
        description: "Moxito 0.5 L is a refreshing carbonated soft drink made with natural lemon, lime, and mint extracts. Perfectly balanced for a crisp and zesty taste, it's an ideal choice to cool down and energize at any time of the day. With no artificial colors or preservatives, Laimon Fresh offers a natural and invigorating beverage experience in a convenient 0.5-liter can.",
        category: "Drink"
    ),
  ];
}