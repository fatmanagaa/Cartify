// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleProductResponseDto _$SingleProductResponseDtoFromJson(
  Map<String, dynamic> json,
) => SingleProductResponseDto(
  data: json['data'] == null
      ? null
      : ProductDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SingleProductResponseDtoToJson(
  SingleProductResponseDto instance,
) => <String, dynamic>{'data': instance.data};
