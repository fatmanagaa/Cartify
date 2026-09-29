import 'package:ecommerce_app/domain/entities/response/product/product.dart';

abstract class ProductRemoteDataSource {

  Future<Product> getAllProducts();
}