import 'package:ecommerce_app/api/model/request/wishlist/add_product_to_wishlist_request_dto.dart';
import 'package:ecommerce_app/domain/entities/request/wishlist/add_product_to_wishlist_request.dart';

extension AddProductToWishlistRequestMapper on AddProductToWishlistRequest {
  AddProductToWishlistRequestDto toDto() {
    return AddProductToWishlistRequestDto(
      productId: productId,
    );
  }
}
