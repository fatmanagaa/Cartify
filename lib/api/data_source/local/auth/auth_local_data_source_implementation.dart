import 'package:injectable/injectable.dart';
import '../../../../core/cache/shared_prefs_utils.dart';
import '../../../../data/data_source/local/auth/auth_local_data_source.dart';

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
    return await SharedPrefsUtils.deleteToken();
  }
}
