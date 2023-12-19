class Task {
  final int priority;
  final bool isDone;
  final String description;
  final String category;
  final List<String> tags;

  Task({
    required this.priority,
    required this.isDone,
    required this.description,
    required this.category,
    required this.tags,
  });

  Task.empty({
    required this.description,
    this.priority = -1,
    this.isDone = false,
    this.category = 'Quehaceres',
    this.tags = const [],
  });
}
