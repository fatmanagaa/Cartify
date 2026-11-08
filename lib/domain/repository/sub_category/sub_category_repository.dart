import '../../entities/response/product/sub_category.dart';

abstract class SubCategoryRepository {
  Future<List<SubCategory>> getSubCategories(String categoryId);
}