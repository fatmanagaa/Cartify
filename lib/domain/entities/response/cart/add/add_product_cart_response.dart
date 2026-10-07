import 'add_cart.dart';

class AddProductCartResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddCart? data;

  const AddProductCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}








