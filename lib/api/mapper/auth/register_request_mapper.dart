import '../../../domain/entities/request/auth/register/register_request.dart';
import '../../model/request/auth/register/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
