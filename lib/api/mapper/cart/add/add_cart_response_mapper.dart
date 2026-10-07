import '../../../../domain/entities/response/cart/add/add_product_cart_response.dart';
import '../../../model/response/cart/add/add_product_cart_response_dto.dart';
import 'add_cart_mapper.dart';

extension AddCartResponseMapper on AddProductCartResponseDto {
  AddProductCartResponse toAddProductCartResponse() {
    return AddProductCartResponse(
      message: message,
      cartId: cartId,
      data: data?.toAddCart(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}