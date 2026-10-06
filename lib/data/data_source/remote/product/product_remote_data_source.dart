import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/domain/entities/response/product/product_response.dart';

import '../../../../domain/entities/response/cart/add/add_product_cart_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> getAllProducts();
  Future<Product?> getProductDetails(String productId);
  Future<AddProductCartResponse> addProductToCart(String productId);

}
