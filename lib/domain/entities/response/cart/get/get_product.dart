
import '../../product/product.dart';

class GetProduct {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  const GetProduct({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}