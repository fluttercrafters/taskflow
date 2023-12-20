import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taskflow/core/app/taskflow_data.dart';
import 'package:taskflow/domain/models/task.dart';

class _TaskFlowScope extends InheritedWidget {
  const _TaskFlowScope({
    required super.child,
    required this.bindingState,
  });

  final TaskFlowBindingState bindingState;

  static TaskFlowBindingState? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_TaskFlowScope>()
        ?.bindingState;
  }

  static TaskFlowBindingState of(BuildContext context) {
    final TaskFlowBindingState? result = maybeOf(context);
    assert(result != null, 'No TaskFlowBindingState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(_TaskFlowScope oldWidget) => true;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TaskFlowBindingState>(
        'bindingState', bindingState));
  }
}

class TaskFlowBinding extends StatefulWidget {
  const TaskFlowBinding({
    super.key,
    required this.initialData,
    required this.child,
  });

  final TaskFlowData initialData;
  final Widget child;

  @override
  TaskFlowBindingState createState() => TaskFlowBindingState();

  static TaskFlowBindingState of(BuildContext context) {
    return _TaskFlowScope.of(context);
  }

  static void addTask(BuildContext context, Task newTask) {
    final state = _TaskFlowScope.of(context);
    state.updateData(TaskFlowData(
      tasks: [
        ...state.currentData.tasks,
        newTask,
      ],
    ));
  }
}

class TaskFlowBindingState extends State<TaskFlowBinding> {
  late TaskFlowData currentData;

  @override
  void initState() {
    super.initState();
    currentData = widget.initialData;
  }

  void updateData(TaskFlowData newData) {
    if (newData != currentData) {
      setState(() {
        currentData = newData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _TaskFlowScope(
      bindingState: this,
      child: widget.child,
    );
  }
}
