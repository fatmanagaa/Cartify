import '../../../domain/entities/response/category_brand/category_or_brand_response.dart';
import '../../../domain/entities/response/comman/category_brand.dart';
import '../../../domain/entities/response/comman/meta_data.dart';
import '../../model/response/category_brand/category_or_brand_dto_response.dart';
import '../../model/response/category_brand/comman/category_brand_dto.dart';
import '../../model/response/category_brand/comman/meta_data_dto.dart';

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


