import '../../../../domain/entities/response/product/sub_category.dart';

abstract class SubCategoryRemoteDataSource {
  Future<List<SubCategory>> getSubCategories(String categoryId);
}
