// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_from_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFromWishlistResponseDto _$DeleteFromWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteFromWishlistResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$DeleteFromWishlistResponseDtoToJson(
  DeleteFromWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
