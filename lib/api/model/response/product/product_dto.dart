import 'package:ecommerce_app/api/model/response/category_brand/comman/category_brand_dto.dart';
import 'package:ecommerce_app/api/model/response/product/sub_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import '../category_brand/comman/meta_data_dto.dart';
part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<SubCategoryDto>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryBrandDto? category;
  @JsonKey(name: "brand")
  final CategoryBrandDto? brand;
  @JsonKey(name: "ratingsAverage")
  final int? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;


  ProductDto ({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDtoToJson(this);
  }
}
