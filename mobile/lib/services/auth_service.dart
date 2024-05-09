import 'dart:convert';
import 'package:http/http.dart' as http;

class AUTHService {
  final String baseUrl = 'http://localhost:3000';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}