import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/core/widgets/appbar.dart';
import 'package:taskflow/features/tasks/hooks/use_tasks.dart';
import 'package:taskflow/features/tasks/widgets/task_list.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: ref.watch(tasksProvider.future),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? TasksList(tasks: snapshot.data ?? [])
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
