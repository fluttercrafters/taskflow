import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskflow/features/tasks/hooks/use_tasks.dart';
import 'package:taskflow/features/tasks/tasks.dart';

class TaskFlowApp extends HookWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksVN = useTasks();

    return ValueListenableBuilder(
      valueListenable: tasksVN,
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TaskFlow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w900, fontSize: 32),
            actionsIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            centerTitle: false,
          ),
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TasksPage(
                tasks: tasksVN.value,
              ),
          '/new-task': (context) => NewTaskPage(
                onTaskSubmitted: (newTask) {
                  tasksVN.value = [...tasksVN.value, newTask];
                  Navigator.pop(context);
                },
              ),
        },
      ),
    );
  }
}
