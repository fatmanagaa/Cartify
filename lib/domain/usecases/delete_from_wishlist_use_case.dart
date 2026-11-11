import 'package:injectable/injectable.dart';

import '../entities/response/wish_list/delete_from_wishlist_response.dart';
import '../repository/wishlist/wishlist_repository.dart';

@injectable
class DeleteFromWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  DeleteFromWishlistUseCase(this._wishlistRepository);

  Future<DeleteFromWishlistResponse> invoke(String productId) {
    return _wishlistRepository.deleteFromWishlist(productId);
  }
}

