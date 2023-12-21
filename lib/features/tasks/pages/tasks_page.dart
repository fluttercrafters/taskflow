import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskflow/core/app/taskflow_data.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/features/tasks/widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskFlowData>().tasks;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: TasksList(tasks: tasks),
    );
  }
}
