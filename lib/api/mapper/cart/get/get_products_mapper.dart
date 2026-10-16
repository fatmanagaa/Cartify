import '../../../../domain/entities/response/cart/get/get_product.dart';
import '../../../model/response/cart/get/get_product_dto.dart';
import '../../product/product_mapper.dart';

extension GetProductsMapper on GetProductDto {
  GetProduct toGetProducts() {
    return GetProduct(
      id: Id,
      price: price,
      count: count,
      product: product?.toProduct(),
    );
  }
}
