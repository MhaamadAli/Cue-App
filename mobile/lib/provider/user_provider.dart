import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AUTHService _authService = AUTHService();

  User? get user => _user;
}
