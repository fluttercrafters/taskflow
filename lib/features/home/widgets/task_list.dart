import 'package:flutter/material.dart';
import 'package:taskflow/domain/models/task.dart';
import 'package:taskflow/features/home/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      children: tasks.map((e) => TaskItem(task: e,)).toList(),
    );
  }
}
