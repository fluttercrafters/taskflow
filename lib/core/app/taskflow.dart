import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow_data.dart';
import 'package:taskflow/domain/models/task.dart';

class _TaskFlowScope extends InheritedWidget {
  const _TaskFlowScope({
    required super.child,
    required this.bindingState,
  });

  final TaskFlowBindingState bindingState;

  static TaskFlowBindingState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_TaskFlowScope>()
        ?.bindingState;
  }

  @override
  bool updateShouldNotify(_TaskFlowScope oldWidget) {
    return true;
  }
}

class TaskFlowBinding extends StatefulWidget {
  const TaskFlowBinding({
    super.key,
    required this.child,
    required this.initialData,
  });

  final Widget child;
  final TaskFlowData initialData;

  static TaskFlowBindingState? maybeOf(BuildContext context) {
    return _TaskFlowScope.of(context);
  }

  static TaskFlowBindingState of(BuildContext context) {
    return _TaskFlowScope.of(context)!;
  }

  @override
  State<TaskFlowBinding> createState() => TaskFlowBindingState();
}

class TaskFlowBindingState extends State<TaskFlowBinding> {
  late TaskFlowData currentData;

  void addTask(Task newTask) {
    setState(() {
      currentData = TaskFlowData(
        tasks: [
          ...currentData.tasks,
          newTask,
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    currentData = widget.initialData;
  }

  @override
  Widget build(BuildContext context) {
    return _TaskFlowScope(
      bindingState: this,
      child: widget.child,
    );
  }
}
