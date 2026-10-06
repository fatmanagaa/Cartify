
import '../../../../domain/entities/response/cart/add/add_cart.dart';
import '../../../model/response/cart/add/add_cart_dto.dart';
import 'add_product_mapper.dart';

extension AddCartMapper on AddCartDto {
  AddCart toAddCart() {
    return AddCart(
      id: id,
      cartOwner: cartOwner,
      products: products?.map((prodDto) => prodDto.toAddProduct()).toList(),
      totalCartPrice: totalCartPrice,
      v: V,
    );
  }
}