
import '../../../domain/entities/response/product/sub_category.dart';
import '../../model/response/product/sub_category_dto.dart';

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