import 'package:json_annotation/json_annotation.dart';

part 'add_address_request_dto.g.dart';

@JsonSerializable()
class AddAddressRequestDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  AddAddressRequestDto({
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  factory AddAddressRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestDtoToJson(this);
}
