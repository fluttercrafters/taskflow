import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/features/tasks/pages/new_task_page.dart';

final _formatter = DateFormat.MMMMd();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('TaskFlow'),
          Text(
            _formatter.format(DateTime.now()),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton.filled(
            onPressed: () {
              Navigator.of(context).push(NewTaskPage.route());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
