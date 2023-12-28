import 'package:tic_tac_toe/models/board_model.dart';

class BoardController {
  final BoardModel model = BoardModel();

  void restart() {
    model.game = List.filled(9, '');
    model.isXTime = true;
    model.gameIsOver = false;
  }

  void markPart(int index) {
    model.game[index] = model.isXTime ? 'x' : 'o';
    model.isXTime = !model.isXTime;
  }

  bool isPartEmpty(int index) {
    return getSymbol(index) == '';
  }

  String getSymbol(int index) {
    return model.game[index];
  }
}
