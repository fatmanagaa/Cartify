import 'package:json_annotation/json_annotation.dart';

part 'add_to_wishlist_response_dto.g.dart';

@JsonSerializable()
class AddToWishlistResponseDto {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final List<String?>? data;

  AddToWishlistResponseDto({this.status, this.message, this.data});

  factory AddToWishlistResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddToWishlistResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AddToWishlistResponseDtoToJson(this);
}
