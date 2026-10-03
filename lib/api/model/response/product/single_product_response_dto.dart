import 'package:ecommerce_app/api/model/response/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_product_response_dto.g.dart';

@JsonSerializable()
class SingleProductResponseDto {
  @JsonKey(name: "data")
  final ProductDto? data;

  SingleProductResponseDto({
    this.data,
  });

  factory SingleProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SingleProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SingleProductResponseDtoToJson(this);
  }
}
