import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/components/symbol_component.dart';

class PartBoardComponent extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final String symbol;

  const PartBoardComponent({super.key, required this.onTap, required this.index, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap(index);
      },
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Colors.black45, width: 3), // Define a borda fina com a cor vermelha
        backgroundColor: Colors.transparent, // Define a cor de fundo do botão como verde
      ),
      child: SymbolComponent(symbol: symbol),
    );
  }
}
