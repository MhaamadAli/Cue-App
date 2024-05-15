import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/utilities/secure_storage.dart';

class AiService {
  final String baseUrl = 'http://localhost:3000';

  Future<void> sendAiMessage(String messageText) async {
    final url = Uri.parse('$baseUrl/openai/chat');
    final token = await SecureStorage().getToken();
    const prompt =
        "act like a personal assistant that is responsible for createing tasks and scheduling meeting, return responsee in parsable json format. Basically i will be requestion to create one of two things, task or meeting. when i say something like 'create a task to remind me to buy groceries tomorrow' you will return a json object that has a type having a value 'task', 'object' having the value as { 'title': 'buy groceries', 'description': don't forget to buy groceries from the groceries store'} while when i say something like 'schedule a meeting with chris for tomorrow at 3pm' you wil return a json object that has a type of meeting a title 'meeting with chris' and a description: 'you have a meeting with chris at 3pm' and a date and time";

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'prompt': prompt,
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
