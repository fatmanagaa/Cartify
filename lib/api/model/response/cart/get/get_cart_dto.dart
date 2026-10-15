import 'package:ecommerce_app/api/model/response/cart/get/get_product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_dto.g.dart';

@JsonSerializable()
class GetCartDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<GetProductDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int?V;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  GetCartDto ({
    this.Id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.totalCartPrice,
  });

  factory GetCartDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartDtoToJson(this);
  }
}