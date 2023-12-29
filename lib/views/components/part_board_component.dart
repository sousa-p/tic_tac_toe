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
        side: const BorderSide(color: Colors.black45, width: 3),
        backgroundColor: Colors.transparent,
      ),
      child: SymbolComponent(symbol: symbol),
    );
  }
}
