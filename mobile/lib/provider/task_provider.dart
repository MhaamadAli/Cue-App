import 'package:flutter/material.dart';
import 'package:mobile/models/task_model.dart';
import 'package:mobile/services/tasks_service.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _allTasks = [];
  final TaskService _taskService;

  TasksProvider(this._taskService);

  List<Task> get allTasks => _allTasks;
}
