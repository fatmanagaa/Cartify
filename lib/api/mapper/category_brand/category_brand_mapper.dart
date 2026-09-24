import '../../../domain/entities/response/comman/category_brand.dart';
import '../../model/response/category_brand/comman/category_brand_dto.dart';

extension CategoryBrandMapper on CategoryBrandDto {
  CategoryBrand toCategoryOrBrand() {
    return CategoryBrand(
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}


