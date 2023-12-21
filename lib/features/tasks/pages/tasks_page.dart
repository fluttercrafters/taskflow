import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/features/tasks/viewmodels/tasks_vm.dart';
import 'package:taskflow/features/tasks/widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (providerContext) => TasksViewModel(
        model: providerContext.read(),
      )
      ..loadTasks(),
      child: const _TasksPage(),
    );
  }
}

class _TasksPage extends StatelessWidget {
  const _TasksPage();

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksViewModel>().tasks;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: TasksList(tasks: tasks),
    );
  }
}
