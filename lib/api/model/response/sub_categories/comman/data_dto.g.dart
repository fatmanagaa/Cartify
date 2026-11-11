// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  category: json['category'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'category': instance.category,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
