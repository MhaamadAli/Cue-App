import 'package:cue_dashboard/models/user_model.dart';
import 'package:cue_dashboard/services/auth_service.dart';
import 'package:cue_dashboard/utilities/secure_storage.dart';
import 'package:flutter/material.dart';

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
}
