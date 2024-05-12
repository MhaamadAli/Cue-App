import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/utilities/secure_storage.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AUTHService _apiService = AUTHService();
  final SecureStorage _secureStorage = SecureStorage();

  User? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      final response = await _apiService.login(email, password);
      print("Retrieved token: ${response['access_token']}"); 
      await _secureStorage.storeToken(response['access_token']);
      _user = User.fromJson(response);
      notifyListeners();
    } catch (e) {
      print('Error during login: $e');
      throw Exception('Login Failed: $e');
    }
  }

  Future<void> signup(String username, String email, String password) async {
    try {
      final response = await _apiService.signup(username, email, password);
      await _secureStorage.storeToken(response['access_token']);
      _user = User.fromJson(response);
      notifyListeners();
    } catch (e) {
      print('Error during signup: $e');
      throw Exception('Signup Failed: $e');
    }
  }

  Future<void> logout() async {
    await _secureStorage.deleteToken();
    _user = null;
    notifyListeners();
  }
}
