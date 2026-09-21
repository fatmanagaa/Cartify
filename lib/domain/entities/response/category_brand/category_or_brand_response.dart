
import 'package:ecommerce_app/domain/entities/response/comman/category_brand.dart';
import 'package:ecommerce_app/domain/entities/response/comman/meta_data.dart';


class CategoryOrBrandResponse {
  final int? results;
  final MetaData? metadata;
  final List<CategoryBrand>? data;

  CategoryOrBrandResponse({
    this.results,
    this.metadata,
    this.data,
  });
}

