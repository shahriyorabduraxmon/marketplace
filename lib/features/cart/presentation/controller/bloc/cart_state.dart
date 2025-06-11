part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Status status;
  final List<ProductEntity> products;
  final int productCounts;
  final double totalPrice;

  const CartState({
    this.status = Status.UNKNOWN,
    this.products = const <ProductEntity>[],
    this.productCounts = 0,
    this.totalPrice = 0,
  });

  CartState copyWith({
    Status? status,
    List<ProductEntity>? products,
    int? productCounts,
    double? totalPrice,
}) =>
      CartState(
        status: status ?? this.status,
        products: products ?? this.products,
        productCounts: productCounts ?? this.productCounts,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  @override
  List<Object> get props => [
    status,
    products,
    productCounts,
    totalPrice,
  ];
}

