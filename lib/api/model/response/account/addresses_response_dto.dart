import 'package:json_annotation/json_annotation.dart';
import 'address_dto.dart';

part 'addresses_response_dto.g.dart';

@JsonSerializable()
class AddressesResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<AddressDto>? data;

  AddressesResponseDto({
    this.status,
    this.message,
    this.data,
  });

  factory AddressesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesResponseDtoToJson(this);
}
