import 'package:flutter/material.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/domain/models/task.dart';
import 'package:taskflow/features/home/widgets/task_form.dart';
import 'package:taskflow/features/home/widgets/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task.empty(description: 'Lavar ropa'),
    Task.empty(description: 'Hacer tarea'),
    Task.empty(description: 'Limpiar cuarto'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: TasksList(tasks: tasks),
          ),
          SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TaskForm(
                onTaskSubmitted: (newTask) {
                  setState(() {
                    tasks.add(newTask);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
