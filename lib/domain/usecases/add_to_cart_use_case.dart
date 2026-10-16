import 'package:injectable/injectable.dart';

import '../entities/response/cart/add/add_product_cart_response.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<AddProductCartResponse> invoke(String productId) {
    return _cartRepository.addProductToCart(productId);
  }
}
