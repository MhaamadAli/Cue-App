import 'dart:convert';
import 'package:cue_dashboard/models/feedback_model.dart';
import 'package:cue_dashboard/utilities/secure_storage.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  final String baseUrl = 'http://192.168.101.207:3000';
  final SecureStorage _secureStorage = SecureStorage();

  FeedbackService();
}
