import '../../../domain/entities/response/product/product.dart';
import '../../model/response/product/product_dto.dart';
import '../../model/response/product/sub_category_dto.dart';
import '../category_brand/category_brand_mapper.dart';
import 'sub_category_mapper.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      slug: slug,
      id: id,
      title: title,
      category: category?.toCategoryOrBrand(),
      description: description,
      brand: brand?.toCategoryOrBrand(),
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory?.map((SubCategoryDto subDto) => subDto.toSubCategory()).toList(),
    );
  }
}
