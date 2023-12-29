import 'package:flutter/material.dart';

class RestartButtonComponent extends StatelessWidget {
  final Function() onPressed;

  const RestartButtonComponent({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      ),
      child: const Text(
        'Restart',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
