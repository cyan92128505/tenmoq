import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_prefs.dart';

class SecureStorageUtil {
  static final String refreshTokenKey = 'atlantis_refreshToken';
  static final String accessTokenKey = 'atlantis_accessToken';
  static final SecureStorageUtil _secureStorageUtil =
      SecureStorageUtil._internal();
  static final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  factory SecureStorageUtil() {
    return _secureStorageUtil;
  }

  SecureStorageUtil._internal();

  Future<bool> legacy() async {
    return await SharedPrefsUtil().useLegacyStorage();
  }

  Future<String> _write(String key, String value) async {
    if (await legacy()) {
      await setEncrypted(key, value);
    } else {
      await secureStorage.write(key: key, value: value);
    }
    return value;
  }

  Future<String> _read(String key, {String defaultValue}) async {
    if (await legacy()) {
      return await getEncrypted(key) ?? defaultValue;
    }
    return await secureStorage.read(key: key) ?? defaultValue;
  }

  Future<String> setRefreshToken(String token) async {
    return await _write(refreshTokenKey, token);
  }

  Future<String> getRefreshToken() async {
    return await _read(refreshTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    if (await legacy()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(refreshTokenKey);
    }
    return await secureStorage.delete(key: refreshTokenKey);
  }

  Future<String> setAccessToken(String token) async {
    return await _write(accessTokenKey, token);
  }

  Future<String> getAccessToken() async {
    return await _read(accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    if (await legacy()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(accessTokenKey);
    }
    return await secureStorage.delete(key: accessTokenKey);
  }

  Future<void> deleteAll() async {
    if (await legacy()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(refreshTokenKey);
      await prefs.remove(accessTokenKey);
      return;
    }
    return await secureStorage.deleteAll();
  }

  // For encrypted data
  Future<void> setEncrypted(String key, String value) async {
    final encrypter = Salsa20Encryptor();
    final encrypted = encrypter.encrypt(value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, encrypted);
  }

  Future<String> getEncrypted(String key) async {
    final encrypter = Salsa20Encryptor();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encrypted = prefs.get(key);
    if (encrypted == null) return null;
    return encrypter.decrypt(encrypted);
  }
}

class Salsa20Encryptor {
  static final Key key = Key.fromUtf8(secret.substring(0, secret.length - 8));
  static final IV iv = IV.fromUtf8(secret.substring(secret.length - 8));
  static final String secret = _getSecret();
  static final _salsa20Encryptor = Salsa20Encryptor._();

  factory Salsa20Encryptor() {
    return _salsa20Encryptor;
  }

  Salsa20Encryptor._();

  static String _getSecret() {
    return '7a0ea3a2fcca69d87e5728519685a70bb102d883';
  }

  String encrypt(String value) {
    final encrypter = Encrypter(Salsa20(key));
    return encrypter.encrypt(value, iv: iv).base64;
  }

  String decrypt(String value) {
    final encrypter = Encrypter(Salsa20(key));
    return encrypter.decrypt64(value, iv: iv);
  }
}
