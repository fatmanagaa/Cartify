// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductDto _$GetProductDtoFromJson(Map<String, dynamic> json) =>
    GetProductDto(
      count: (json['count'] as num?)?.toInt(),
      Id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductDtoToJson(GetProductDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.Id,
      'product': instance.product,
      'price': instance.price,
    };
