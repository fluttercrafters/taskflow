import 'package:flutter/material.dart';
import 'package:taskflow/core/widgets/appbar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Text(
        'Detail',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
