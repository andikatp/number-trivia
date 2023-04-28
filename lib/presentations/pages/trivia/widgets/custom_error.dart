// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String message;
  const CustomError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Icon(
          Icons.error,
          color: theme.colorScheme.error,
          size: 50,
        ),
        const SizedBox(height: 20),
        Text(
          message,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
