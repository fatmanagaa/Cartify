import 'package:ecommerce_app/domain/entities/response/product/product_response.dart';
import 'package:injectable/injectable.dart';

import '../repository/product/product_repository.dart';

@injectable
class GetAllProductsUseCase {
  final ProductRepository productRepository;

  GetAllProductsUseCase(this.productRepository);

  Future<ProductResponse?> invoke() async {
    return await productRepository.getAllProducts();
  }
}
