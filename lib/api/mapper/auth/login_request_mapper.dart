import '../../../domain/entities/request/auth/login/login_request.dart';
import '../../model/request/auth/login/login_request_dto.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(
      password: password,
      email: email,
    );
  }
}