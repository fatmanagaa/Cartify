import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';

abstract class CategoryRepository {
   Future<CategoryOrBrandResponse?> getCategories();
}