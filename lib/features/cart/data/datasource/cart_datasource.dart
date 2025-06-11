import 'package:dio/dio.dart';
import 'package:marketplace/core/dio/exceptions/error_handle.dart';
import 'package:marketplace/core/dio/singletons/dio_settings.dart';
import 'package:marketplace/core/dio/singletons/service_locator.dart';
import 'package:marketplace/core/services/hive_service/product_hive_service.dart';
import 'package:marketplace/features/home/data/model/product/product_model.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

abstract class CartDataSource {
  Future<List<ProductModel>> getCart();
}

class CartDataSourceImpl extends CartDataSource {
  Dio get dio => serviceLocator<DioSettings>().dio;
  ErrorHandle handle = ErrorHandle();

  @override
  Future<List<ProductModel>> getCart() async {
    final ProductHiveService service = ProductHiveService();
    List<ProductEntity> products = await service.getProductList();
    await Future.delayed(Duration(milliseconds: 800));
    List<ProductModel> productsList = products.map((e) {
      return ProductModel(
        id: e.id,
        image: e.image,
        name: e.name,
        price: e.price,
        description: e.description,
        category: e.category,
        cartCount: e.cartCount, // agar mavjud bo‘lsa
      );
    }).toList();
    return productsList;
    // return handle.apiCantrol(
    //   request: () {
    //     return dio.get(
    //         "api",
    //     );
    //   },
    //   body: (response) {
    //     return (response['results'] as List).map((res) => ProductModel.fromJson(res)).toList();
    //   },
    // );
  }
}
