import 'package:ecommerce_app/api/model/response/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist_dto.g.dart';

@JsonSerializable()
class GetWishlistDto {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'data')
  final List<ProductDto>? data;

  GetWishlistDto({
    this.status,
    this.count,
    this.data,
  });

  factory GetWishlistDto.fromJson(Map<String, dynamic> json) => _$GetWishlistDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWishlistDtoToJson(this);
}