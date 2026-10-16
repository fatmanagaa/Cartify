
import 'get_cart.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCart? data;

  const GetCartResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}