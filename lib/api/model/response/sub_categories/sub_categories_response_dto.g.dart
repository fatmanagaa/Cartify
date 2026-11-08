// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoriesResponse _$SubCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => SubCategoriesResponse(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubCategoriesResponseToJson(
  SubCategoriesResponse instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
