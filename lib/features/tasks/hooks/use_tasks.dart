import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskflow/domain/models/task.dart';

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

ValueNotifier<List<Task>> useTasks({List<Task> initialData = _defaultTasks}) {
  final result = useState<List<Task>>(initialData);
  useValueChanged<List<Task>, void>(result.value, (_, __) {
    debugPrint('Tasks count: ${result.value.length}');
  });
  return result;
}
