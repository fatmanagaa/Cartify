import '../../entities/response/wish_list/add_to_wishlist_response.dart';
import '../../entities/response/wish_list/delete_from_wishlist_response.dart';
import '../../entities/response/wish_list/get_wishlist_response.dart';

abstract class WishlistRepository {
  Future<AddToWishlistResponse> addToWishlist(String productId);

  Future<DeleteFromWishlistResponse> deleteFromWishlist(String productId);

  Future<GetWishlistResponse> getWishlist();
}

