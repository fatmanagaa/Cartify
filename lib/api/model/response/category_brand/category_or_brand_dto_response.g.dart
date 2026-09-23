// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_or_brand_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryOrBrandDtoResponse _$CategoryOrBrandDtoResponseFromJson(
  Map<String, dynamic> json,
) => CategoryOrBrandDtoResponse(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : MetaDataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CategoryBrandDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryOrBrandDtoResponseToJson(
  CategoryOrBrandDtoResponse instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
