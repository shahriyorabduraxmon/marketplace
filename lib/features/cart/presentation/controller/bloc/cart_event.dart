part of 'cart_bloc.dart';

abstract class CartEvent{
  const CartEvent();
}

class GetCartEvent extends CartEvent {}
class DeleteCartEvent extends CartEvent {}
class DeleteCartItemEvent extends CartEvent {
  final ProductEntity product;
  const DeleteCartItemEvent({required this.product});
}
class UpdateCartItemEvent extends CartEvent {
  final int count;
  final ProductEntity product;
  const UpdateCartItemEvent({required this.count, required this.product});
}
class AddCartItemEvent extends CartEvent {
  final ProductEntity product;
  const AddCartItemEvent({required this.product});
}