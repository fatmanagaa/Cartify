// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_data_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDataRequestDto _$UpdateUserDataRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateUserDataRequestDto(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UpdateUserDataRequestDtoToJson(
        UpdateUserDataRequestDto instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
    };
