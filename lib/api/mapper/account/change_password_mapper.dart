import '../../../domain/entities/request/account/change_password_request.dart';
import '../../model/request/account/change_password_request_dto.dart';

extension ChangePasswordRequestMapper on ChangePasswordRequest {
  ChangePasswordRequestDto toDto() {
    return ChangePasswordRequestDto(
      currentPassword: currentPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
