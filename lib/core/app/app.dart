import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow.dart';
import 'package:taskflow/core/app/taskflow_data.dart';
import 'package:taskflow/features/home/home.dart';

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskFlowBinding(
      initialData: const TaskFlowData(),
      child: MaterialApp(
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
          ),
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const HomePage(),
      ),
    );
  }
}
