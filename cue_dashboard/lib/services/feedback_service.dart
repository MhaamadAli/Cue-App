import 'dart:convert';
import 'package:cue_dashboard/models/feedback_model.dart';
import 'package:cue_dashboard/utilities/secure_storage.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  final String baseUrl = 'http://192.168.101.207:3000';
  final SecureStorage _secureStorage = SecureStorage();

  FeedbackService();
  Future<List<FeedbackModel>> fetchFeedbacks() async {
    final token = await _secureStorage.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/feedbacks'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    List<dynamic> responseData = json.decode(response.body);
    print('Response data: $responseData');
    return responseData
        .map((feedback) => FeedbackModel.fromJson(feedback))
        .toList();
  }
}
