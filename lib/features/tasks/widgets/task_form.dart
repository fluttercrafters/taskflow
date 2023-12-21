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
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController(text: null);
  final _categoryController = TextEditingController(text: null);
  final _tagsController = TextEditingController(text: null);

  bool isChecked = false;

  @override
  void dispose() {
    _controller.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Task Description',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Campo requerido';

                  return null;
                },
                controller: _controller,
              ),
              const Gap(16),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Category',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Campo requerido';

                  return null;
                },
                controller: _categoryController,
              ),
              const Gap(16),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Tags (comma sepparated)',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Campo requerido';

                  return null;
                },
                controller: _tagsController,
              ),
              const Gap(16),
              Row(
                children: [
                  Checkbox.adaptive(
                    value: isChecked,
                    onChanged: (value) => setState(() {
                      isChecked = value ?? false;
                    }),
                  ),
                  const Text('Checkbox')
                ],
              ),
              CheckboxListTile.adaptive(
                value: isChecked,
                onChanged: (value) => setState(() {
                  isChecked = value ?? false;
                }),
                title: const Text('Algun checkbox'),
              ),
            ],
          ),
        ),
        const Gap(16),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onTaskSubmitted(Task.empty(
                  description: _controller.text,
                  category: _categoryController.text,
                  tags: _tagsController.text.split(',')));
              _controller.clear();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
