// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWishlistDto _$GetWishlistDtoFromJson(Map<String, dynamic> json) =>
    GetWishlistDto(
      status: json['status'] as String?,
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWishlistDtoToJson(GetWishlistDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'data': instance.data,
    };
