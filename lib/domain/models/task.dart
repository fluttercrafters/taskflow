import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int priority;
  final bool isDone;
  final String description;
  final String category;
  final List<String> tags;

  const Task({
    required this.priority,
    required this.isDone,
    required this.description,
    required this.category,
    required this.tags,
  });

  const Task.description({
    required this.description,
    this.priority = -1,
    this.isDone = false,
    this.category = 'Sin Categoría',
    this.tags = const [],
  });

  static Task empty = const Task.description(description: '');

  @override
  List<Object?> get props => [
        priority,
        isDone,
        description,
        category,
        tags,
      ];
}
