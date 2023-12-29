import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/board_model.dart';

class BoardController {
  final BoardModel model = BoardModel();

  void restart() {
    model.game = List.filled(9, '');
    model.isXTime = true;
    model.gameIsOver = false;
    model.winner = null;
  }

  void gameOver() {
    model.gameIsOver = true;
  }

  void markPart(int index) {
    if (!model.gameIsOver) {
      model.game[index] = model.isXTime ? 'x' : 'o';
      model.isXTime = !model.isXTime;
    }
  }

  bool isPartEmpty(int index) {
    return getSymbol(index).isEmpty;
  }

  String getSymbol(int index) {
    return model.game[index];
  }

  void resultOfPlay() {
    model.winner = whoWins();

    if (model.winner != null) gameOver();
  }

  String? whoWins() {
    if (countFilledParts() > 5) return null;

    const List<List<int>> winCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [0, 4, 8]
    ];

    for (var c in winCombinations) {
      String p0 = getSymbol(c[0]);
      String p1 = getSymbol(c[1]);
      String p2 = getSymbol(c[2]);

      if (p0.isNotEmpty && p0 == p1 && p1 == p2) return p0.toUpperCase();
    }

    if (itsADraw()) return 'Draw';
    return null;
  }

  int countFilledParts() {
    return model.game.fold(0, (count, part) => part.isEmpty ? 1 : 0);
  }

  bool itsADraw() {
    return !model.game.contains('');
  }
}
