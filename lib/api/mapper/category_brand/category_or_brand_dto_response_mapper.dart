import '../../../domain/entities/response/category_brand/category_or_brand_response.dart';
import '../../model/response/category_brand/category_or_brand_dto_response.dart';
import 'category_brand_mapper.dart';
import 'meta_data_mapper.dart';

extension CategoryOrBrandDtoResponseMapper on CategoryOrBrandDtoResponse {
  CategoryOrBrandResponse toCategoryOrBrandResponse() {
    return CategoryOrBrandResponse(
      results: results,
      metadata: metadata?.toMetaData(),
      data: data?.map((catDto) => catDto.toCategoryOrBrand()).toList(),
    );
  }
}
