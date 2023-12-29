import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controllers/board_controller.dart';
import 'package:tic_tac_toe/views/breakpoints.dart';
import 'package:tic_tac_toe/views/components/alert_component.dart';
import 'package:tic_tac_toe/views/components/confetti_component.dart';
import 'package:tic_tac_toe/views/components/part_board_component.dart';
import 'package:tic_tac_toe/views/components/restart_button_component.dart';
import 'package:confetti/confetti.dart';

class BoardComponent extends StatefulWidget {
  const BoardComponent({super.key});

  @override
  State<BoardComponent> createState() => _BoardComponentState();
}

class _BoardComponentState extends State<BoardComponent> {
  late ConfettiController _confettiController;
  final BoardController controller = BoardController();
  final Breakpoints brk = Breakpoints();

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void handleClick(int index) {
    setState(() {
      if (!controller.model.gameIsOver) {
        if (controller.isPartEmpty(index)) controller.markPart(index);
        controller.resultOfPlay();

        if (controller.model.winner != null && controller.model.winner != 'Draw') winScene();
      }
    });
  }

  void winScene() {
    showWinAlert();
    _confettiController.play();
  }

  void handleRestartClick() {
    setState(() {
      controller.restart();
    });
  }

  void showWinAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertComponent(title: '${controller.model.winner} wins!', description: 'Congratulations on you win!');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConfettiComponent(alignment: Alignment.centerLeft, confettiController: _confettiController),
        ConfettiComponent(alignment: Alignment.centerRight, confettiController: _confettiController),
        const SizedBox(
          height: 100,
        ),
        SizedBox.square(
          dimension: (w > brk.desktop)
              ? 500
              : (w > brk.tablet)
                  ? w * .4
                  : (w > brk.mobile)
                      ? w * .6
                      : w * .85,
          child: GridView.count(
            shrinkWrap: true,
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
        RestartButtonComponent(onPressed: handleRestartClick),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
