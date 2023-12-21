import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskflow/data/tasks_model.dart';
import 'package:taskflow/domain/models/task.dart';

class TasksViewModel extends ChangeNotifier {
  TasksViewModel({required this.model}) {
    tasksSuscription = model.tasksStream.listen((event) {
      _tasks = event;
      notifyListeners();
    });
  }

  late StreamSubscription tasksSuscription;
  final TasksModel model;
   List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void loadTasks() {
    model.loadTasks();
  }

  @override
  void dispose() {
    tasksSuscription.cancel();
    super.dispose();
  }
}
