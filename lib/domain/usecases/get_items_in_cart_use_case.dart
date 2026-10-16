import 'package:ecommerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/cart/get/get_cart_response.dart';

@injectable
class GetItemsInCartUseCase {
  final CartRepository cartRepository;

  GetItemsInCartUseCase(this.cartRepository);

  Future<GetCartResponse?> invoke() async {
    return await cartRepository.getItemsInCart();
  }
}
