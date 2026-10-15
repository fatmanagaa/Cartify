import '../../../model/response/cart/get/get_product_dto.dart';

extension GetProductsMapper on GetProductDto {
  GetProduct toGetProducts() {
    return GetProducts(
      id: id,
      price: price,
      count: count,
      product: product!.toProduct(),
    );
  }
}