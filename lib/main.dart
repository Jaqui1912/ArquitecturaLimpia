import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/providers/comparison_provider.dart';
import 'presentation/styles/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ComparisonProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Comparator',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
