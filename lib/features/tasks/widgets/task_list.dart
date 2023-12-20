import 'package:flutter/material.dart';
import 'package:taskflow/domain/models/task.dart';
import 'package:taskflow/features/tasks/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.onTaskPressed,
  });

  final List<Task> tasks;
  final OnTaskPressed? onTaskPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      children: tasks
          .map((task) => TaskItem(
                task: task,
                onPressed: onTaskPressed,
              ))
          .toList(),
    );
  }
}
