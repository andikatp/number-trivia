import 'package:flutter/material.dart';

class CustomTrivia extends StatelessWidget {
  final String trivia;
  const CustomTrivia({required this.trivia, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      trivia,
      style: theme.textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
