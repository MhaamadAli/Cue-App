import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AUTHService _authService = AUTHService();

  User? get user => _user;

  Future<void> login(String email, String password) async {
    final response = await _authService.login(email, password);
    _user = User.fromJson(response);
    notifyListeners();
  }
}
