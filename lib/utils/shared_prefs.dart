import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static final SharedPrefsUtil _sharedPrefsUtil = SharedPrefsUtil._internal();
  // Keys
  static const String use_legacy_storage = 'atlantis_legacy_storage';

  factory SharedPrefsUtil() {
    return _sharedPrefsUtil;
  }

  SharedPrefsUtil._internal();

  Future<void> set(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    }
  }

  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) ?? defaultValue;
  }

  Future<bool> useLegacyStorage() async {
    return await get(use_legacy_storage, defaultValue: false);
  }

  Future<void> setUseLegacyStorage() async {
    await set(use_legacy_storage, true);
  }
}
