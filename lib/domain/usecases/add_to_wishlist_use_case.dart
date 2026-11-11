import 'package:injectable/injectable.dart';

import '../entities/response/wish_list/add_to_wishlist_response.dart';
import '../repository/wishlist/wishlist_repository.dart';

@injectable
class AddToWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  AddToWishlistUseCase(this._wishlistRepository);

  Future<AddToWishlistResponse> invoke(String productId) {
    return _wishlistRepository.addToWishlist(productId);
  }
}

