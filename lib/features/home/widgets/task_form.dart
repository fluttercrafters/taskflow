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
  final _controller = TextEditingController(text: null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Task Description',
            ),
            controller: _controller,
          ),
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () {
            widget.onTaskSubmitted(Task.description(description: _controller.text));
            _controller.clear();
          }
              ,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
