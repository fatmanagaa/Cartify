// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      if (instance.id case final value?) '_id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.details case final value?) 'details': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.city case final value?) 'city': value,
    };
