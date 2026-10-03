import '../../../domain/entities/response/product/product_response.dart';
import '../../model/response/product/product_response_dto.dart';
import '../category_brand/meta_data_mapper.dart';
import 'product_mapper.dart';

extension ProductResponseDtoMapper on ProductResponseDto {
  ProductResponse toProductResponse() {
    return ProductResponse(
      results: results,
      metadata: metadata?.toMetaData(),
      data: data?.map((productDto) => productDto.toProduct()).toList(),
    );
  }
}
