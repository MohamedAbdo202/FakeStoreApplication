import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SecurePreferences {
  final FlutterSecureStorage instance;

  SecurePreferences() : instance = const FlutterSecureStorage();
}
