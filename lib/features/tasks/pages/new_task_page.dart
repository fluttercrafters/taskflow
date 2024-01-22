import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/features/tasks/hooks/use_tasks.dart';
import 'package:taskflow/features/tasks/widgets/task_form.dart';

class NewTaskPage extends HookConsumerWidget {
  const NewTaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TaskForm(
          onTaskSubmitted: (newTask) {
            ref
                .read(tasksProvider.notifier)
                .addTask(newTask)
                .then((value) => Navigator.of(context).pop());
          },
        ),
      ),
    );
  }
}
