import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/double_player.dart';
import 'package:tic_tac_toe/screens/single_player.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SinglePLayer(),
                  ),
                );
              },
              child: const Text(
                "Single Player",
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoublePlayer(),
                  ),
                );
              },
              child: const Text(
                "Double Player",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
