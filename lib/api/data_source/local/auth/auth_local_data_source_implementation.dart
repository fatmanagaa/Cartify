import 'package:injectable/injectable.dart';
import '../../../../core/cache/shared_prefs_utils.dart';
import '../../../../data/data_source/local/auth/auth_local_data_source.dart';
import '../../../../domain/entities/response/auth/user.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<bool> saveToken(String token) async {
    return await SharedPrefsUtils.saveToken(token);
  }

  @override
  Future<String?> getToken() async {
    return SharedPrefsUtils.getToken();
  }

  @override
  Future<bool> deleteToken() async {
    await SharedPrefsUtils.deleteUser();
    return await SharedPrefsUtils.deleteToken();
  }

  @override
  Future<bool> saveUser(User user) async {
    return await SharedPrefsUtils.saveUser(
      name: user.name,
      email: user.email,
      phone: user.phone,
    );
  }

  @override
  Future<User?> getUser() async {
    final name = SharedPrefsUtils.getUserName();
    final email = SharedPrefsUtils.getUserEmail();
    final phone = SharedPrefsUtils.getUserPhone();

    if (name == null && email == null && phone == null) {
      return null;
    }
    return User(
      name: name,
      email: email,
      phone: phone,
    );
  }

  @override
  Future<bool> deleteUser() async {
    return await SharedPrefsUtils.deleteUser();
  }
}
