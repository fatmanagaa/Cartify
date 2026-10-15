import '../../../../domain/entities/response/cart/get/get_cart.dart';
import '../../../model/response/cart/get/get_cart_dto.dart';

extension GetCartMapper on GetCartDto {
  GetCart toGetCart() {
    return GetCart(
      id: id,
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      v: v,
      products: products?.map((GetProductsDto getProductDto) => getProductDto.toGetProducts()).toList(),
    );
  }
}