import 'package:flutter/material.dart';
import 'package:app_test/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Main';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Home(),
    );
  }
}

