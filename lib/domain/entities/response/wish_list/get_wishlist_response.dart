import 'package:ecommerce_app/domain/entities/response/product/product.dart';

class GetWishlistResponse {
  final String? status;
  final int? count;
  final List<Product>? data;

  const GetWishlistResponse({
    this.status,
    this.count,
    this.data,
  });
}

