import 'package:injectable/injectable.dart';

import '../entities/response/wish_list/get_wishlist_response.dart';
import '../repository/wishlist/wishlist_repository.dart';

@injectable
class GetWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  GetWishlistUseCase(this._wishlistRepository);

  Future<GetWishlistResponse> invoke() {
    return _wishlistRepository.getWishlist();
  }
}

