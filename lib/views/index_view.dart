import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/components/board_component.dart';

class IndexView extends StatelessWidget {
  const IndexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SingleChildScrollView(
          child: Center(child: BoardComponent()),
        ),
      ),
    );
  }
}
