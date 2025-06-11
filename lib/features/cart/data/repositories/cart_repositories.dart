import 'package:dio/dio.dart';
import 'package:marketplace/core/dio/exceptions/exceptions.dart';
import 'package:marketplace/core/dio/exceptions/failures.dart';
import 'package:marketplace/core/dio/singletons/api_constants.dart';
import 'package:marketplace/core/dio/utils/either.dart';
import 'package:marketplace/features/cart/data/datasource/cart_datasource.dart';
import 'package:marketplace/features/cart/domain/repositories/cart_repo.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class CartRepoImpl extends CartRepo {
  final CartDataSourceImpl dataSource;

  CartRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getCart() async {
    bool hasInternet = await isInternetConnected();
    if (!hasInternet) {
      return Left(const NetworkFailure(errorMessage: 'Please check your network!'));
    }
    try {
      final result = await dataSource.getCart();
      return Right(result);
    } on DioException {
      return Left(const DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
