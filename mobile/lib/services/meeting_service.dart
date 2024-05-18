import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/utilities/secure_storage.dart';

class MeetingService {
  final String baseUrl = 'http://192.168.0.105:3000';
  final SecureStorage _secureStorage = SecureStorage();

  MeetingService();

  Future<List<Meeting>> fetchAllMeetings() async {
    final authToken = await _secureStorage.getToken();
    print("Using token for meeting request: $authToken");
    final response = await http.get(
      Uri.parse('$baseUrl/meetings'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Meeting data received: ${response.body}");
      List<dynamic> meetingsJson = json.decode(response.body);
      return meetingsJson.map((json) => Meeting.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meetings');
    }
  }
}
