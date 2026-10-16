import '../../../../domain/entities/response/cart/add/add_product_cart_response.dart';
import '../../../../domain/entities/response/cart/get/get_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<AddProductCartResponse> addProductToCart(String productId);

  Future<GetCartResponse> getItemsInCart();

  Future<GetCartResponse> deleteItemsInCart(String productId);

  Future<GetCartResponse> updateCountInCart(
      String productId,
      int count
      );
}
