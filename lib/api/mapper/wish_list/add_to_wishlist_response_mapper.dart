import 'package:ecommerce_app/api/model/response/wish_list/add_to_wishlist_response_dto.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/add_to_wishlist_response.dart';

extension AddToWishlistResponseMapper on AddToWishlistResponseDto {
  AddToWishlistResponse toAddToWishlistResponse() {
    return AddToWishlistResponse(
      status: status,
      message: message,
      data: data,
    );
  }
}
