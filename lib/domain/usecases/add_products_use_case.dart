import 'package:ecommerce_app/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:ecommerce_app/domain/repository/cart/cart_repository.dart';
import 'package:ecommerce_app/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductsUseCase {
  final CartRepository cartRepository;

  AddProductsUseCase(this.cartRepository);

  Future<AddProductCartResponse?> invoke(String productId) async {
    return await cartRepository.addProductToCart(productId);
  }
}
