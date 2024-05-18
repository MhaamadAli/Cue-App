import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/utilities/secure_storage.dart';
import 'package:intl/intl.dart';

class FeedbackService {
  final String baseUrl = 'http://192.168.0.105:3000';

  Future<void> sendFeedback(String feedbackText, int userId) async {
    final url = Uri.parse('$baseUrl/feedbacks');
    final token = await SecureStorage().getToken();
    final String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc());

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'message': feedbackText,
        'timestamp': formattedDate,
        'userId': userId
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to send feedback: ${response.body}');
    }
  }
}
