import '../../../domain/entities/response/product/sub_category.dart';
import '../../model/response/product/sub_category_dto.dart';
import '../../model/response/sub_categories/comman/data_dto.dart';
import '../../model/response/sub_categories/sub_categories_response_dto.dart';

extension SubCategoryMapper on SubCategoryDto {
  SubCategory toSubCategory() {
    return SubCategory(
      category: category,
      id: id,
      slug: slug,
      name: name,
    );
  }
}

extension DataToSubCategoryMapper on Data {
  SubCategory toSubCategory() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  }
}

extension SubCategoriesResponseMapper on SubCategoriesResponse {
  List<SubCategory> toSubCategoryList() {
    return data?.map((e) => e.toSubCategory()).toList() ?? [];
  }
}
