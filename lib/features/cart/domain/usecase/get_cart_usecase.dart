import 'package:marketplace/core/dio/exceptions/failures.dart';
import 'package:marketplace/core/dio/singletons/service_locator.dart';
import 'package:marketplace/core/dio/usecases/usecase.dart';
import 'package:marketplace/core/dio/utils/either.dart';
import 'package:marketplace/features/cart/data/repositories/cart_repositories.dart';
import 'package:marketplace/features/cart/domain/repositories/cart_repo.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class GetCartUsease extends UseCase<List<ProductEntity>, NoParams> {
  final CartRepo repository = serviceLocator<CartRepoImpl>();

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async => await repository.getCart();
}