import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/core/app/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TaskFlowApp(),
    ),
  );
}
