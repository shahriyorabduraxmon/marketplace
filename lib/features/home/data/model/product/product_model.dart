import 'package:json_annotation/json_annotation.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.image,
    super.name,
    super.price,
    super.description,
    super.category,
    super.cartCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}