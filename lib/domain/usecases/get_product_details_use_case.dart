import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

import '../repository/product/product_repository.dart';

@injectable
class GetProductDetailsUseCase {
  final ProductRepository productRepository;

  GetProductDetailsUseCase(this.productRepository);

  Future<Product?> invoke(String productId) async {
    return await productRepository.getProductDetails(productId);
  }
}
