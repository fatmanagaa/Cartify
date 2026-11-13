import '../../../domain/entities/request/account/update_user_data_request.dart';
import '../../model/request/account/update_user_data_request_dto.dart';

extension UpdateUserDataRequestMapper on UpdateUserDataRequest {
  UpdateUserDataRequestDto toDto() {
    return UpdateUserDataRequestDto(
      name: name,
      email: email,
      phone: phone,
    );
  }
}
