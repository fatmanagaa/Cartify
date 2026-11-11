import 'package:ecommerce_app/api/model/response/wish_list/delete_from_wishlist_response_dto.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/delete_from_wishlist_response.dart';

extension DeleteFromWishlistResponseMapper on DeleteFromWishlistResponseDto {
  DeleteFromWishlistResponse toDeleteFromWishlistResponse() {
    return DeleteFromWishlistResponse(
      status: status,
      message: message,
      data: data,
    );
  }
}
