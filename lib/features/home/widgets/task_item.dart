import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskflow/domain/models/task.dart';

final _cardColors = [
  Colors.red[50],
  Colors.cyan[50],
  Colors.amber[50],
  Colors.blue[50],
  Colors.pink[50],
  Colors.purple[50],
];

enum TaskAction {
  edit,
  delete,
}

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final randomColor = _cardColors[Random().nextInt(_cardColors.length)];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: randomColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.task.category.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
                PopupMenuButton<TaskAction>(
                  initialValue: null,
                  onSelected: (TaskAction item) {
                    setState(() {
                      // selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<TaskAction>>[
                    const PopupMenuItem<TaskAction>(
                      value: TaskAction.edit,
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),
                          Gap(4),
                          Expanded(child: Text('Edit')),
                        ],
                      ),
                    ),
                    const PopupMenuItem<TaskAction>(
                      value: TaskAction.delete,
                      child: Row(
                        children: [
                          Icon(Icons.delete_outlined),
                          Gap(4),
                          Expanded(child: Text('Delete')),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.task.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
