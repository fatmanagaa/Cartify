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
}
