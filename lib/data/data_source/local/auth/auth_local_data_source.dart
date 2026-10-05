abstract class AuthLocalDataSource {
  Future<bool> saveToken(String token);

  Future<String?> getToken();

  Future<bool> deleteToken();
}
