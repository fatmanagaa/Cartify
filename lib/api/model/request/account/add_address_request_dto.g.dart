// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequestDto _$AddAddressRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AddAddressRequestDto(
      name: json['name'] as String?,
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$AddAddressRequestDtoToJson(
        AddAddressRequestDto instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.details case final value?) 'details': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.city case final value?) 'city': value,
    };
