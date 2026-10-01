import 'package:ecommerce_app/domain/entities/response/product/product_response.dart';

abstract class ProductRepository {
  Future<ProductResponse?> getAllProducts();
}
