import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences _sharedPreferences;
  static const String _tokenKey = 'auth_token';

  /// Initialize SharedPreferences instance
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Generic method to save data into SharedPreferences
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    if (value is List<String>) return await _sharedPreferences.setStringList(key, value);
    return false;
  }

  /// Generic method to get data from SharedPreferences
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  /// Generic method to remove data by key
  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  /// Method to clear all saved preferences
  static Future<bool> clearAll() async {
    return await _sharedPreferences.clear();
  }

  /// Helper method to save Token
  static Future<bool> saveToken(String token) async {
    return await saveData(key: _tokenKey, value: token);
  }

  /// Helper method to retrieve Token
  static String? getToken() {
    final token = getData(key: _tokenKey);
    if (token is String && token.isNotEmpty) {
      return token;
    }
    return null;
  }

  /// Helper method to delete Token (on Logout)
  static Future<bool> deleteToken() async {
    return await removeData(key: _tokenKey);
  }

  /// Helper method to check if Token exists
  static bool hasToken() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }

  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userPhoneKey = 'user_phone';

  /// Save User info
  static Future<bool> saveUser({
    String? name,
    String? email,
    String? phone,
  }) async {
    if (name != null && name.isNotEmpty) await saveData(key: _userNameKey, value: name);
    if (email != null && email.isNotEmpty) await saveData(key: _userEmailKey, value: email);
    if (phone != null && phone.isNotEmpty) await saveData(key: _userPhoneKey, value: phone);
    return true;
  }

  /// Retrieve User info
  static String? getUserName() {
    final name = getData(key: _userNameKey);
    return name is String && name.isNotEmpty ? name : null;
  }

  static String? getUserEmail() {
    final email = getData(key: _userEmailKey);
    return email is String && email.isNotEmpty ? email : null;
  }

  static String? getUserPhone() {
    final phone = getData(key: _userPhoneKey);
    return phone is String && phone.isNotEmpty ? phone : null;
  }

  /// Delete User info
  static Future<bool> deleteUser() async {
    await removeData(key: _userNameKey);
    await removeData(key: _userEmailKey);
    await removeData(key: _userPhoneKey);
    return true;
  }
}
