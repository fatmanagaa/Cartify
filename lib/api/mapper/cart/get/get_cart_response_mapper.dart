import '../../../../domain/entities/response/cart/get/get_cart_response.dart';
import '../../../model/response/cart/get/get_cart_response_dto.dart';

extension GetCartResponseMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      cartId: cartId,
      data: data!.toGetCart(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}