import '../../../../domain/entities/response/auth/user.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveToken(String token);

  Future<String?> getToken();

  Future<bool> deleteToken();

  Future<bool> saveUser(User user);

  Future<User?> getUser();

  Future<bool> deleteUser();
}
