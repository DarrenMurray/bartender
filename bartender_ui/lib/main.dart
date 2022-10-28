import 'package:flutter/material.dart';
import 'widgets/homeWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bartender mk1',
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: Colors.white,
      ),
      home: const Homepage(title: 'Bartender'),
    );
  }
}

