import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow.dart';
import 'package:taskflow/features/tasks/form/task_form.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const NewTaskPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TaskForm(
          onTaskSubmitted: (newTask) {
            TaskFlowBinding.addTask(context, newTask);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
