import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskflow/core/app/taskflow_data.dart';
import 'package:taskflow/features/tasks/tasks.dart';

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskFlowData(),
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
            centerTitle: false,
          ),
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const TasksPage(),
      ),
    );
  }
}
