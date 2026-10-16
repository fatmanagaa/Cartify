import 'package:injectable/injectable.dart';

import '../entities/response/cart/get/get_cart_response.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class DeleteItemsInCartUseCase {
  final CartRepository _cartRepository;

  DeleteItemsInCartUseCase(this._cartRepository);

  Future<GetCartResponse> invoke(String productId) {
    return _cartRepository.deleteItemsInCart(productId);
  }
}
