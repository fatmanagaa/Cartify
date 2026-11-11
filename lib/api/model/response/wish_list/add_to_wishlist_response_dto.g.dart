// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToWishlistResponseDto _$AddToWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddToWishlistResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$AddToWishlistResponseDtoToJson(
  AddToWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
