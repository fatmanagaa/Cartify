import 'package:json_annotation/json_annotation.dart';

import '../comman/category_brand_dto.dart';
import '../comman/meta_data_dto.dart';


part 'category_or_brand_dto.g.dart';

@JsonSerializable()
class CategoryOrBrandDtoResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "data")
  final List<CategoryBrandDto>? data;

  CategoryOrBrandDtoResponse ({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoryOrBrandDtoResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryOrBrandDtoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryOrBrandDtoResponseToJson(this);
  }
}





