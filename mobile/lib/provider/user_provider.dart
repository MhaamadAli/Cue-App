import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AUTHService _authService = AUTHService();

  User? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      final response = await _authService.login(email, password);
      print('API Response: $response');
      _user = User.fromJson(response);
      notifyListeners();
    } catch (e) {
      print('Error during login: $e');
      throw Exception('Login Failed: $e');
    }
  }
}
