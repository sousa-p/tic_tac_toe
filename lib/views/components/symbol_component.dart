import 'package:flutter/material.dart';

class SymbolComponent extends StatelessWidget {
  final String symbol;

  const SymbolComponent({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: (symbol.isEmpty)
          ? const Text('')
          : Center(
              child: Text(
                symbol,
                style: const TextStyle(fontSize: 72), // Defina o tamanho da fonte como 24 (ou o tamanho desejado)
              ),
            ),
    );
  }
}
