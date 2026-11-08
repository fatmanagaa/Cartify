import 'package:json_annotation/json_annotation.dart';

import 'comman/data_dto.dart';
import 'comman/meta_data_dto.dart';

part 'sub_categories_response_dto.g.dart';

@JsonSerializable()
class SubCategoriesResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "data")
  final List<Data>? data;

  SubCategoriesResponse ({
    this.results,
    this.metadata,
    this.data,
  });

  factory SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$SubCategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubCategoriesResponseToJson(this);
  }
}





