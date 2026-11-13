// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesResponseDto _$AddressesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddressesResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressesResponseDtoToJson(
        AddressesResponseDto instance) =>
    <String, dynamic>{
      if (instance.status case final value?) 'status': value,
      if (instance.message case final value?) 'message': value,
      if (instance.data case final value?) 'data': value,
    };
