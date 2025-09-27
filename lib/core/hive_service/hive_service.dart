import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._();

  static const String encryptionBoxKey = 'HiveEncryptionKey';
  static final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();
  static late Box<dynamic> _storageBox;

  /// Initialize Hive instance
  static Future<HiveService> getInstance({
    required String boxName,
    VoidCallback? registerAdapters,
  }) async {
    try {
      final encryptionCipher = await _encryptionKey;

      final dir = await getApplicationSupportDirectory();
      Hive.init(dir.path);

      registerAdapters?.call();

      _storageBox = await Hive.openBox(
        boxName,
        encryptionCipher: encryptionCipher,
      );

      return HiveService._();
    } on HiveError catch (e) {
      debugPrint('Hive initialization error: $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Unexpected HiveService init error: $e');
      rethrow;
    }
  }

  /// Retrieve or generate encryption key for secure Hive storage
  static Future<HiveAesCipher> get _encryptionKey async {
    Uint8List? encryptionKey;
    final keyString = await _secureStorage.read(key: encryptionBoxKey);

    if (keyString == null) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(
        key: encryptionBoxKey,
        value: base64UrlEncode(key),
      );
      encryptionKey = Uint8List.fromList(key);
    } else {
      encryptionKey = base64Url.decode(keyString);
    }
    return HiveAesCipher(encryptionKey);
  }

  /// Retrieve value from Hive storage
  static T? get<T>({required String key, T? defaultValue}) {
    return _storageBox.get(key, defaultValue: defaultValue) as T?;
  }

  /// Retrieve list from Hive storage (JSON encoded)
  static List<dynamic> getList({
    required String key,
    List<dynamic> defaultValue = const [],
  }) {
    try {
      final json = _storageBox.get(key, defaultValue: '') as String;
      if (json.isEmpty) {
        return defaultValue;
      }
      return jsonDecode(json) as List<dynamic>;
    } catch (_) {
      return defaultValue;
    }
  }

  /// Store a value in Hive storage
  static Future<void> put<T>({required String key, required T value}) async {
    return _storageBox.put(key, value);
  }

  /// Store a map in Hive storage
  static Future<void> putMap({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    return _storageBox.put(key, value);
  }

  /// Store a list in Hive storage (JSON encoded)
  static Future<void> putList<T>({
    required String key,
    required List<T> value,
  }) async {
    final data = jsonEncode(value);
    return _storageBox.put(key, data);
  }

  /// Store multiple values in Hive storage
  static Future<void> putAll({required Map<String, dynamic> entries}) async {
    return _storageBox.putAll(entries);
  }

  /// Delete a value from Hive storage
  static Future<void> delete({required String key}) async {
    return _storageBox.delete(key);
  }

  /// Clear all data in Hive storage
  static Future<int> clear() async {
    return _storageBox.clear();
  }

  /// Close Hive storage
  static Future<void> close() async {
    await _storageBox.close();
  }

  static Future<Map<String, dynamic>?> getMap({required String key}) async {
    final data = _storageBox.get(key);
    if (data == null) return null;

    if (data is Map) {
      return data.map((k, v) => MapEntry(k.toString(), v));
    }

    return null;
  }
}
