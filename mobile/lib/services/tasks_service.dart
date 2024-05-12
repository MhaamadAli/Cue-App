import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/task_model.dart';
import 'package:mobile/utilities/secure_storage.dart';

class TaskService {
  final String baseUrl = 'http://localhost:3000';
  final SecureStorage _secureStorage = SecureStorage();

  TaskService();

  Future<List<Task>> fetchAllTasks() async {
    final authToken = await _secureStorage.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/tasks/'),
    );
    List<dynamic> tasksJson = json.decode(response.body);
    return tasksJson.map((json) => Task.fromJson(json)).toList();
  }
  
}
