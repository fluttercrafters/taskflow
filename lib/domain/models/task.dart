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

  const Task.empty({
    required this.description,
    this.priority = -1,
    this.isDone = false,
    this.category = 'Sin Categoría',
    this.tags = const [],
  });

  @override
  List<Object?> get props => [
        priority,
        isDone,
        description,
        category,
        tags,
      ];
}
