import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/utilities/secure_storage.dart';

class MeetingService {
  final String baseUrl = 'http://localhost:3000';
  final SecureStorage secureStorage;

  MeetingService(this.secureStorage);

  Future<List<Meeting>> fetchMeetings() async {
    final authToken = await secureStorage.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/meetings'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      List<dynamic> meetingsJson = json.decode(response.body);
      return meetingsJson.map((json) => Meeting.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meetings');
    }
  }
}
