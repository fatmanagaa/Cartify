
import '../../../../domain/entities/response/cart/add/add_product_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<AddProductCartResponse> addProductToCart(String productId);
}