import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'jwtToken', value: token);
    print("Token stored successfully");
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: 'jwtToken');
    print("Retrieved token from storage: $token");
    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwtToken');
  }
}
