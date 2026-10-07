import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/domain/entities/response/product/product_response.dart';
import '../../entities/response/cart/add/add_product_cart_response.dart';

abstract class ProductRepository {
  Future<ProductResponse?> getAllProducts();

  Future<Product?> getProductDetails(String productId);

  Future<AddProductCartResponse> addProductToCart(String productId);
}
