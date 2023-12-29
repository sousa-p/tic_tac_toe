import 'package:flutter/material.dart';

class AlertComponent extends StatelessWidget {
  final String title;
  final String description;
  const AlertComponent({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
