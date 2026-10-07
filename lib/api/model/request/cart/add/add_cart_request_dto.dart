import 'package:json_annotation/json_annotation.dart';

part 'add_cart_request_dto.g.dart';

@JsonSerializable()
class AddCartRequestDto {
  @JsonKey(name: "productId")
  final String? productId;

  AddCartRequestDto ({
    this.productId,
  });

  factory AddCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartRequestDtoToJson(this);
  }
}


