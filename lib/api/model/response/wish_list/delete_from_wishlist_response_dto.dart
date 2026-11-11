import 'package:json_annotation/json_annotation.dart';

part 'delete_from_wishlist_response_dto.g.dart';

@JsonSerializable()
class DeleteFromWishlistResponseDto {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final List<String?>? data;

  DeleteFromWishlistResponseDto({
    this.status,
    this.message,
    this.data,
  });

  factory DeleteFromWishlistResponseDto.fromJson(Map<String, dynamic> json) => _$DeleteFromWishlistResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFromWishlistResponseDtoToJson(this);
}