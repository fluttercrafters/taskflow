import 'dart:async';

import 'package:taskflow/domain/models/task.dart';

// MVVM -> Model, View, ViewModel

const dummy = [
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
    ];

class TasksModel {
  List<Task> _tasks = dummy;

  Stream<List<Task>> get tasksStream => _controller.stream;
  final StreamController<List<Task>> _controller = StreamController.broadcast();

  TasksModel() {
    _controller.add(_tasks);
  }

  void loadTasks() {
    _controller.add(_tasks);
  }

  void addTask(Task newTask) {
    _tasks = [
      ..._tasks,
      newTask,
    ];

    _controller.add(_tasks);
  }
}
