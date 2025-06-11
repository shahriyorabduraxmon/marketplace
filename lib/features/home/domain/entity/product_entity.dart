import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:marketplace/features/home/data/model/product/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0) // unique ID har bir model uchun kerak
class ProductEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String category;

  @HiveField(6)
  final int cartCount;

  const ProductEntity({
    this.id = 0,
    this.image = '',
    this.name= '',
    this.price = 0,
    this.description = '',
    this.category = '',
    this.cartCount = 0,
  });

  @override
  List<Object?> get props => [
    id,
    image,
    name,
    price,
    description,
    category,
  ];

  ProductEntity copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    String? description,
    String? category,
    int? cartCount,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      cartCount: cartCount ?? this.cartCount,
    );
  }
}

class ProductConverter implements JsonConverter<ProductEntity, Map<String, dynamic>?> {
  const ProductConverter();
  @override
  ProductEntity fromJson(Map<String, dynamic>? json) => ProductModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ProductEntity object) => {};
}