import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/storage/storage_keys.dart';

@lazySingleton
class TokenStorage {
  const TokenStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<String?> getAccessToken() =>
      _secureStorage.read(key: StorageKeys.accessToken);

  Future<void> saveAccessToken(String token) =>
      _secureStorage.write(key: StorageKeys.accessToken, value: token);

  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: StorageKeys.refreshToken);

  Future<void> saveRefreshToken(String token) =>
      _secureStorage.write(key: StorageKeys.refreshToken, value: token);

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: StorageKeys.accessToken);
    await _secureStorage.delete(key: StorageKeys.refreshToken);
  }
}
