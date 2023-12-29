import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiComponent extends StatelessWidget {
  final Alignment alignment;
  final ConfettiController confettiController;
  const ConfettiComponent({super.key, required this.alignment, required this.confettiController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: 90,
        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: .5,
        minimumSize: const Size(10, 10),
        maximumSize: const Size(50, 50),
        gravity: .9,
      ),
    );
  }
}
