import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AUTHService {
  final baseUrl = dotenv.env['API_URL'];

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    var responseData = json.decode(response.body);
    return responseData;
  }
}
