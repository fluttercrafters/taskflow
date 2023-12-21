import 'package:flutter/material.dart';
import 'package:taskflow/domain/models/task.dart';

class TaskFlowData extends ChangeNotifier {
  List<Task> tasks;

  TaskFlowData({
    this.tasks = const [
      Task.empty(
        description: 'Lavar ropa',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task.empty(
        description: 'Hacer tarea',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task.empty(
        description: 'Limpiar cuarto',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
          'home',
          'living',
          'health',
          'home',
          'living',
          'health',
          'home',
          'living',
          'health',
          'home',
          'living',
          'health',
          'home',
          'living',
          'health',
        ],
      ),
    ],
  });

  void addTask(Task newTask) {
    tasks = [...tasks, newTask];
    notifyListeners();
  }
}
