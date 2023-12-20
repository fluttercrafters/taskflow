import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/features/home/widgets/task_form.dart';
import 'package:taskflow/features/home/widgets/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child:
                TasksList(tasks: TaskFlowBinding.of(context).currentData.tasks),
          ),
          SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TaskForm(
                onTaskSubmitted: (newTask) {
                  TaskFlowBinding.addTask(context, newTask);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
