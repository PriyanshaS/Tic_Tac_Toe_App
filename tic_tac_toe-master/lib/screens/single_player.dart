import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/gamebutton.dart';

import '../widget/custom_diologbox.dart';

class SinglePLayer extends StatefulWidget {
  const SinglePLayer({Key? key}) : super(key: key);

  @override
  State<SinglePLayer> createState() => _SinglePLayer();
}

class _SinglePLayer extends State<SinglePLayer> {
  List<GameButton> buttonList = [];
  var player1;
  var player2;
  var activePlayer;

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.yellow;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.blue;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enable = false;
      int winner = checkWinner();

      if (winner == -1) {
        if (buttonList.every((element) => element.text != "")) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CustomDialog(
                "Game Tied", "Press Restart to play again", resetGame),
          );
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonList.indexWhere((p) => p.id == cellID);
    playGame(buttonList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CustomDialog("Player 1 Won",
                "Press the reset button to start again.", resetGame));
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => CustomDialog("Player 2 Won",
              "Press the reset button to start again.", resetGame),
        );
      }
    }

    return winner;
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;
    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  @override
  void initState() {
    super.initState();
    buttonList = doInit();
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInit();
    });
  }

  void floatingButtonFunc() {
    setState(() {
      buttonList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.restart_alt,
          color: Colors.black,
          size: 35,
        ),
        onPressed: floatingButtonFunc,
      ),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Tic",
                style: TextStyle(color: Colors.yellow, fontSize: 30),
              ),
              Text(
                "Tac",
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
              Text(
                "Toe",
                style: TextStyle(color: Colors.yellow, fontSize: 30),
              )
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(9),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9),
              itemCount: buttonList.length,
              itemBuilder: (context, index) => SizedBox(
                height: 100,
                width: 100,
                child: RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: buttonList[index].enable
                      ? () => playGame(buttonList[index])
                      : null,
                  child: Text(
                    buttonList[index].text,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  disabledColor: buttonList[index].bg,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
