import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';

abstract class ProductRepository {
   Future<Product?> getAllProducts();
}