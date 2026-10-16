import '../../entities/request/cart/update/count_request.dart';
import '../../entities/response/cart/add/add_product_cart_response.dart';
import '../../entities/response/cart/get/get_cart_response.dart';

abstract class CartRepository {
  Future<AddProductCartResponse> addProductToCart(String productId);

  Future<GetCartResponse> getItemsInCart();

  Future<GetCartResponse> deleteItemsInCart(String productId);

  Future<GetCartResponse> updateCountInCart(
    String productId,
    int count
  );
}
