import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/utilities/secure_storage.dart';
import 'package:intl/intl.dart';

class FeedbackService {
  final String baseUrl = 'http://localhost:3000';

  Future<void> sendFeedback(String feedbackText, int userId) async {
    final url = Uri.parse('$baseUrl/feedbacks');
    final token = await SecureStorage().getToken();
    
  }
}
