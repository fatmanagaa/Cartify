
import 'get_product.dart';

class GetCart {
  final String? id;
  final String? cartOwner;
  final List<GetProduct>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  const GetCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}