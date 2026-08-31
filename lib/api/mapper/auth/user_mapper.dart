
import '../../../domain/entities/response/auth/user.dart';
import '../../model/response/auth/user_dto.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      email: email,
      name: name,
    );
  }
}