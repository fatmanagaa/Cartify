import 'package:ecommerce_app/api/mapper/auth/user_mapper.dart';
import '../../../domain/entities/response/auth/auth_response.dart';
import '../../model/response/auth/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponse() {
    return AuthResponse(
      user: user?.toUser(),
      token: token,
      message: message,
    );
  }
}