import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/domain/models/task.dart';

final tasksProvider = AsyncNotifierProvider.autoDispose<TaskListNotifier, List<Task>>(
  TaskListNotifier.new,
);

const _defaultTasks = [
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
];

class TaskListNotifier extends AutoDisposeAsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    return [..._defaultTasks];
  }

  Future<void> addTask(Task newTask) async {
    final previousState = await future;
    state = AsyncData([...previousState, newTask]);
  }
}