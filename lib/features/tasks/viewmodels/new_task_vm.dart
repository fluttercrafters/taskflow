
import 'package:flutter/material.dart';
import 'package:taskflow/data/tasks_model.dart';
import 'package:taskflow/domain/models/task.dart';

class NewTaskViewModel extends ChangeNotifier {

  NewTaskViewModel({required this.model});
  
  final TasksModel model;

  void addNewTask(Task task) {
    model.addTask(task);
    notifyListeners();
  }
  
}