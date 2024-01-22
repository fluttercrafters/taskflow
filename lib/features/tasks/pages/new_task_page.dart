import 'package:flutter/material.dart';
import 'package:taskflow/domain/models/task.dart';
import 'package:taskflow/features/tasks/widgets/task_form.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({
    super.key,
    required this.onTaskSubmitted,
  });

  final void Function(Task) onTaskSubmitted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TaskForm(
          onTaskSubmitted: onTaskSubmitted,
        ),
      ),
    );
  }
}
