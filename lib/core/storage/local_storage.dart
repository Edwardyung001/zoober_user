import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  /// Save a value (String only)
  static Future<void> saveValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Get a value
  static Future<String?> getValue(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a specific key
  static Future<void> deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all keys
  static Future<void> clearAll() async {
    await _storage.deleteAll();
    print('🔒 SecureStorage cleared!');
  }
}
