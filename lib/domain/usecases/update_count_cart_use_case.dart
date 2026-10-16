import 'package:injectable/injectable.dart';

import '../entities/response/cart/get/get_cart_response.dart';
import '../repository/cart/cart_repository.dart';

@injectable
class UpdateCountInCartUseCase {
  final CartRepository _cartRepository;

  UpdateCountInCartUseCase(this._cartRepository);

  Future<GetCartResponse> invoke(String productId, int count) {
    return _cartRepository.updateCountInCart(productId, count);
  }
}
