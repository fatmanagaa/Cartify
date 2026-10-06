import '../../../../domain/entities/response/cart/add/add_product.dart';
import '../../../model/response/cart/add/add_product_dto.dart';
extension AddProductMapper on AddProductDto {
  AddProduct toAddProduct() {
    return AddProduct(
      id: id,
      price: price,
      count: count,
      product: product,
    );
  }
}