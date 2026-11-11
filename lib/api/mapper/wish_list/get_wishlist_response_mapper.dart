import 'package:ecommerce_app/api/mapper/product/product_mapper.dart';
import 'package:ecommerce_app/api/model/response/wish_list/get_wishlist_dto.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/get_wishlist_response.dart';

extension GetWishlistResponseMapper on GetWishlistDto {
  GetWishlistResponse toGetWishlistResponse() {
    return GetWishlistResponse(
      status: status,
      count: count,
      data: data?.map((e) => e.toProduct()).toList(),
    );
  }
}

