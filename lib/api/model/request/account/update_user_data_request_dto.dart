import 'package:json_annotation/json_annotation.dart';

part 'update_user_data_request_dto.g.dart';

@JsonSerializable()
class UpdateUserDataRequestDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;

  UpdateUserDataRequestDto({
    this.name,
    this.email,
    this.phone,
  });

  factory UpdateUserDataRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDataRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDataRequestDtoToJson(this);
}
