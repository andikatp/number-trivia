import 'package:flutter/material.dart';
import 'package:number_trivia/presentations/pages/trivia/trivia_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const TriviaPageWrapperProvider(),
    );
  }
}
