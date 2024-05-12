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
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> tasksJson = json.decode(response.body);
      return tasksJson.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load all tasks');
    }
  }

  Future<List<Task>> fetchTodoTasks() async {
    final authToken = await _secureStorage.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/tasks/todo'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List<dynamic> tasksJson = json.decode(response.body);
    return tasksJson.map((json) => Task.fromJson(json)).toList();
  }
}
