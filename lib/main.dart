import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/_home_screen.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blackishColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
