import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow.dart';
import 'package:taskflow/features/tasks/widgets/task_form.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  static PageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const NewTaskPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TaskForm(
          onTaskSubmitted: (newTask) {
            TaskFlowBinding.of(context).addTask(newTask);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
