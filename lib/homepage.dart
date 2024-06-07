import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/gamescreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Tik Tak Toe',
            style: TextStyle(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(),
                    ));
              },
              child: const Text('Start New Game'),
            ),
          )
        ],
      ),
    );
  }
}
