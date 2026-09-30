import 'package:ecommerce_app/domain/entities/response/comman/meta_data.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';

class ProductResponse {
  final int? results;
  final MetaData? metadata;
  final List<Product>? data;

  ProductResponse({
    this.results,
    this.metadata,
    this.data,
  });
}
