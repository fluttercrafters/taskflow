import 'package:equatable/equatable.dart';
import 'package:taskflow/domain/models/task.dart';

class TaskFlowData extends Equatable {
  final List<Task> tasks;

  const TaskFlowData({
    this.tasks = const [],
  });

  @override
  List<Object?> get props => [
        tasks,
      ];
}
