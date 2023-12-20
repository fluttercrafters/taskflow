import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskflow/domain/models/task.dart';

typedef OnTaskSubmitted = void Function(Task newTask);

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
    required this.onTaskSubmitted,
  });

  final OnTaskSubmitted onTaskSubmitted;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController(text: null);
  final _categoryController = TextEditingController(text: null);
  final _tagsController = TextEditingController(text: null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText: 'Task Description',
          ),
          controller: _titleController,
        ),
        const Gap(16),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText: 'Category',
          ),
          controller: _categoryController,
        ),
        const Gap(16),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText: 'Tags (comma separated)',
          ),
          controller: _tagsController,
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () {
            widget.onTaskSubmitted(Task(
              priority: 1,
              description: _titleController.text,
              category: _categoryController.text,
              tags: _tagsController.text.split(','),
              isDone: false,
            ));
            _titleController.clear();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
