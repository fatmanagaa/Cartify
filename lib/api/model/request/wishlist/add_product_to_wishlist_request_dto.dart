import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_wishlist_request_dto.g.dart';

@JsonSerializable()
class AddProductToWishlistRequestDto {
  @JsonKey(name: 'productId')
  final String? productId;

  AddProductToWishlistRequestDto({this.productId});

  factory AddProductToWishlistRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddProductToWishlistRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AddProductToWishlistRequestDtoToJson(this);
}
