import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controllers/board_controller.dart';
import 'package:tic_tac_toe/views/components/part_board_component.dart';

class BoardComponent extends StatefulWidget {
  const BoardComponent({super.key});

  @override
  State<BoardComponent> createState() => _BoardComponentState();
}

class _BoardComponentState extends State<BoardComponent> {
  final BoardController controller = BoardController();

  void handleClick(int index) {
    setState(() {
      if (controller.isPartEmpty(index)) controller.markPart(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        SizedBox.square(
          dimension: w * .4,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              9,
              (index) => PartBoardComponent(
                index: index,
                symbol: controller.getSymbol(index),
                onTap: handleClick,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              controller.restart();
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: 64, vertical: 32), // Defina o preenchimento como 16.0 (ou o valor desejado)
          ),
          child: const Text('Restart'),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
