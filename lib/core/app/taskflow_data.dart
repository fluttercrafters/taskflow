import 'package:equatable/equatable.dart';
import 'package:taskflow/domain/models/task.dart';

class TaskFlowData extends Equatable {
  final List<Task> tasks;

  const TaskFlowData({
    this.tasks = const [
      Task.empty(
        description: 'Lavar ropa',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task.empty(
        description: 'Hacer tarea',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
        ],
      ),
      Task.empty(
        description: 'Limpiar cuarto',
        category: 'Hogar',
        tags: [
          'home',
          'living',
          'health',
           'home',
          'living',
          'health',
           'home',
          'living',
          'health',
           'home',
          'living',
          'health',
           'home',
          'living',
          'health',
           'home',
          'living',
          'health',
        ],
      ),
    ],
  });

  @override
  List<Object?> get props => [tasks];
}
