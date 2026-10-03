import 'package:ecommerce_app/domain/entities/response/comman/category_brand.dart';
import 'package:ecommerce_app/domain/entities/response/product/sub_category.dart';

class Product {
  final int? sold;
  final List<String>? images;
  final List<SubCategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryBrand? category;
  final CategoryBrand? brand;
  final num? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  const Product({
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
  });
}
