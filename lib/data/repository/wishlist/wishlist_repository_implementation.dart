import 'package:injectable/injectable.dart';

import '../../../domain/entities/response/wish_list/add_to_wishlist_response.dart';
import '../../../domain/entities/response/wish_list/delete_from_wishlist_response.dart';
import '../../../domain/entities/response/wish_list/get_wishlist_response.dart';
import '../../../domain/repository/wishlist/wishlist_repository.dart';
import '../../data_source/remote/wishlist/wishlist_remote_data_source.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource _wishlistRemoteDataSource;

  WishlistRepositoryImpl(this._wishlistRemoteDataSource);

  @override
  Future<AddToWishlistResponse> addToWishlist(String productId) {
    return _wishlistRemoteDataSource.addToWishlist(productId);
  }

  @override
  Future<DeleteFromWishlistResponse> deleteFromWishlist(String productId) {
    return _wishlistRemoteDataSource.deleteFromWishlist(productId);
  }

  @override
  Future<GetWishlistResponse> getWishlist() {
    return _wishlistRemoteDataSource.getWishlist();
  }
}

