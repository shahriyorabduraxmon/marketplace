import 'package:marketplace/core/dio/exceptions/failures.dart';
import 'package:marketplace/core/dio/utils/either.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ProductEntity>>> getCart();
}
