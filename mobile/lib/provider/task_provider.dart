import 'package:flutter/material.dart';
import 'package:mobile/models/task_model.dart';
import 'package:mobile/services/tasks_service.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _allTasks = [];
  List<Task> _todoTasks = [];
  final TaskService _taskService;

  TasksProvider(this._taskService);

  List<Task> get allTasks => _allTasks;
  List<Task> get todoTasks => _todoTasks;

  Future<void> loadAllTasks() async {
    _allTasks = await _taskService.fetchAllTasks();
    notifyListeners();
  }

  Future<void> loadTodoTasks() async {
    _todoTasks = await _taskService.fetchTodoTasks();
    notifyListeners();
  }

  Future<void> updateTaskStatus(int taskId) async {
    Task? updatedTask = await _taskService.markTaskAsDone(taskId);
    if (updatedTask != null) {
      int index = _allTasks.indexWhere((task) => task.id == taskId);
      if (index != -1) {
        _allTasks[index] = updatedTask;
        notifyListeners();
      }
    } else {
      throw Exception('failed to load updated task, TaskProvider');
    }
  }
}
