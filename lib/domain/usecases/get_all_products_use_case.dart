import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:ecommerce_app/domain/repository/brand/brand_repository.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

import '../repository/product/product_repository.dart';
@injectable
class GetAllProductsUseCase {
  final ProductRepository productRepository;

  GetAllProductsUseCase(this.productRepository);

  Future<Product?> invoke() async {
    return await productRepository.getAllProducts();
  }
}
