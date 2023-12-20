import 'package:equatable/equatable.dart';
import 'package:taskflow/domain/models/task.dart';

class TaskFlowData extends Equatable {
  final List<Task> tasks;

  const TaskFlowData({
    this.tasks = const [
      Task(
        priority: 1,
        isDone: false,
        description: 'Wash the dishes.',
        category: 'Home',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task(
        priority: 2,
        isDone: false,
        description: 'Clean the kitchen.',
        category: 'Home',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task(
        priority: 2,
        isDone: false,
        description: 'Take out the trash.',
        category: 'Home',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
    ],
  });

  @override
  List<Object?> get props => [
        tasks,
      ];
}
