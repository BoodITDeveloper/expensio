import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExpensioApp());
}

class ExpensioApp extends StatelessWidget {
  const ExpensioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const HomePage(),
      // optioneel: je kunt hier named routes toevoegen later
    );
  }
}