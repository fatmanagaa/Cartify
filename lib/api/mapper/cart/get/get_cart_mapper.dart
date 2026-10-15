import '../../../../domain/entities/response/cart/get/get_cart.dart';
import '../../../model/response/cart/get/get_cart_dto.dart';
import '../../../model/response/cart/get/get_product_dto.dart';
import 'get_products_mapper.dart';

extension GetCartMapper on GetCartDto {
  GetCart toGetCart() {
    return GetCart(
      id: Id,
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      v: V,
      createdAt: createdAt,
      updatedAt: updatedAt,
      products: products?.map((GetProductDto getProductDto) => getProductDto.toGetProducts()).toList(),
    );
  }
}
