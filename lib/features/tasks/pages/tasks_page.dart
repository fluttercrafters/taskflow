import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/features/tasks/pages/task_detail_page.dart';
import 'package:taskflow/features/tasks/widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: TasksList(
        tasks: TaskFlowBinding.of(context).currentData.tasks,
        onTaskPressed: (task) =>
            Navigator.of(context).push(DetailPage.route(task)),
      ),
    );
  }
}
