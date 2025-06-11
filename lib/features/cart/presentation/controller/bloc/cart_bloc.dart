import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/core/constants/constants.dart';
import 'package:marketplace/core/dio/usecases/usecase.dart';
import 'package:marketplace/core/services/hive_service/product_hive_service.dart';
import 'package:marketplace/core/utils/log_service.dart';
import 'package:marketplace/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUsease getCart = GetCartUsease();
  final ProductHiveService service = ProductHiveService();
  CartBloc() : super(const CartState()) {
    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      var result = await getCart.call(NoParams());

      if (result.isRight) {
        int productCounts = 0;
        double totalPrice = 0;
        result.right.forEach((product) {
          productCounts = productCounts + product.cartCount;
          totalPrice = totalPrice + (product.price * product.cartCount);
        });
        emit(state.copyWith(
          status: Status.SUCCESS,
          products: result.right,
          productCounts: productCounts,
          totalPrice: totalPrice,
        ));
      }else if(result.isLeft){
        emit(state.copyWith(status: Status.ERROR));
      }
    });

    on<DeleteCartEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      await service.deleteProductList();
      emit(state.copyWith(
        status: Status.SUCCESS,
        products: [],
        productCounts: 0,
        totalPrice: 0,
      ));
    });

    on<DeleteCartItemEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      service.deleteProduct(event.product.id);
      final List<ProductEntity> products = state.products;
      products.removeWhere((product) => product.id == event.product.id);
      emit(state.copyWith(
        status: Status.SUCCESS,
        products: products,
        productCounts: state.productCounts - event.product.cartCount,
        totalPrice: state.totalPrice - (event.product.price * event.product.cartCount),
      ));
    });

    on<UpdateCartItemEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      service.updateProductCount(event.product.id, event.count);
      final List<ProductEntity> products = List.from(state.products);
      for(int i = 0; i< products.length; i++){
        if(products[i].id == event.product.id){
          products[i] = products[i].copyWith(
            cartCount: event.count
          );
          break;
        }
      }
      emit(state.copyWith(
        status: Status.SUCCESS,
        products: products,
        productCounts: state.productCounts - (event.product.cartCount - event.count),
        totalPrice: state.totalPrice - (event.product.price * (event.product.cartCount - event.count)),
      ));
    });

    on<AddCartItemEvent>((event, emit) async {
      emit(state.copyWith(status: Status.LOADING));
      ProductEntity product = event.product.copyWith(cartCount: 1);
      service.addProduct(product);
      final List<ProductEntity> products = List.from(state.products);
      products.add(product);
      emit(state.copyWith(
        status: Status.SUCCESS,
        products: products,
        productCounts: state.productCounts + 1,
        totalPrice: state.totalPrice + event.product.price,
      ));
    });
  }
}
