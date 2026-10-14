
import '../../entities/response/cart/add/add_product_cart_response.dart';

abstract class CartRepository {
  Future<AddProductCartResponse> addProductToCart(String productId);
}