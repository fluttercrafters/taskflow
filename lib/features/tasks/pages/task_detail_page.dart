import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskflow/domain/models/task.dart';

final _cardColors = [
  Colors.red,
  Colors.cyan,
  Colors.amber,
  Colors.blue,
  Colors.pink,
  Colors.purple,
];

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.task,
  });

  static PageRoute route(Task task) => MaterialPageRoute(
        builder: (context) => DetailPage(task: task),
      );

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DESCRIPTION',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Gap(8),
            Text(
              task.description,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(16),
            Text(
              'CATEGORY',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Gap(8),
            Text(
              task.category,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(16),
            Text(
              'TAGS',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Gap(8),
            Wrap(
              spacing: 8,
              children: task.tags.map((tag) {
                final randomColor =
                    _cardColors[Random().nextInt(_cardColors.length)];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: randomColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      tag,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
