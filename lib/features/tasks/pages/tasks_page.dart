import 'package:flutter/material.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/domain/models/task.dart';
import 'package:taskflow/features/tasks/widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: TasksList(
        tasks: tasks,
      ),
    );
  }
}
