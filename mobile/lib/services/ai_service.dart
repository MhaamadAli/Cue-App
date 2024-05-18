import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/utilities/secure_storage.dart';

class AiService {
  final String baseUrl = 'http://192.168.0.105:3000';

  Future<void> sendAiMessage(String messageText) async {
    final url = Uri.parse('$baseUrl/openai/chat');
    final token = await SecureStorage().getToken();
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'messages': [
          {'text': messageText, 'ai': false},
        ]
        }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to send ai message: ${response.body}');
    }
  }
}
