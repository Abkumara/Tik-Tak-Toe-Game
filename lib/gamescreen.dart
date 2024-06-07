import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/homepage.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> listOfGrid = List.filled(9, '');
  bool sign = true;
  int draw = 0;
  int player1 = 0;
  int player2 = 0;
  void reset() {
    listOfGrid = List.filled(9, '');
    sign = true;
    draw = 0;
  }

  void restart() {
    setState(() {
      listOfGrid = List.filled(9, '');
      sign = true;
      draw = 0;
      player1 = 0;
      player2 = 0;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Player 1\n      ${player1.toString()}',
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text('VS',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text('Player 2\n      ${player2.toString()}',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 450,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.amber,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (listOfGrid[index] == '') {
                            if (sign) {
                              listOfGrid[index] = 'X';
                              sign = !sign;
                            } else {
                              listOfGrid[index] = 'O';
                              sign = !sign;
                            }
                          }
                          draw++;
                          if ((listOfGrid[0] == 'X' &&
                                  listOfGrid[1] == 'X' &&
                                  listOfGrid[2] == 'X') ||
                              (listOfGrid[3] == 'X' &&
                                  listOfGrid[4] == 'X' &&
                                  listOfGrid[5] == 'X') ||
                              (listOfGrid[6] == 'X' &&
                                  listOfGrid[7] == 'X' &&
                                  listOfGrid[8] == 'X') ||
                              (listOfGrid[0] == 'X' &&
                                  listOfGrid[3] == 'X' &&
                                  listOfGrid[6] == 'X') ||
                              (listOfGrid[1] == 'X' &&
                                  listOfGrid[4] == 'X' &&
                                  listOfGrid[7] == 'X') ||
                              (listOfGrid[2] == 'X' &&
                                  listOfGrid[5] == 'X' &&
                                  listOfGrid[8] == 'X') ||
                              (listOfGrid[0] == 'X' &&
                                  listOfGrid[4] == 'X' &&
                                  listOfGrid[8] == 'X') ||
                              (listOfGrid[2] == 'X' &&
                                  listOfGrid[4] == 'X' &&
                                  listOfGrid[6] == 'X')) {
                            print('player 1 won');
                            player1++;
                            showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                });
                                return const AlertDialog(
                                  title: Text('Player 1 Won the Game'),
                                );
                              },
                            );

                            reset();
                          } else if ((listOfGrid[0] == 'O' &&
                                  listOfGrid[1] == 'O' &&
                                  listOfGrid[2] == 'O') ||
                              (listOfGrid[3] == 'O' &&
                                  listOfGrid[4] == 'O' &&
                                  listOfGrid[5] == 'O') ||
                              (listOfGrid[6] == 'O' &&
                                  listOfGrid[7] == 'O' &&
                                  listOfGrid[8] == 'O') ||
                              (listOfGrid[0] == 'O' &&
                                  listOfGrid[3] == 'O' &&
                                  listOfGrid[6] == 'O') ||
                              (listOfGrid[1] == 'O' &&
                                  listOfGrid[4] == 'O' &&
                                  listOfGrid[7] == 'O') ||
                              (listOfGrid[2] == 'O' &&
                                  listOfGrid[5] == 'O' &&
                                  listOfGrid[8] == 'O') ||
                              (listOfGrid[0] == 'O' &&
                                  listOfGrid[4] == 'O' &&
                                  listOfGrid[8] == 'O') ||
                              (listOfGrid[2] == 'O' &&
                                  listOfGrid[4] == 'O' &&
                                  listOfGrid[6] == 'O')) {
                            print('player 2 won');
                            player2++;
                            showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                });
                                return const AlertDialog(
                                  title: Text('Player 2 Won the Game'),
                                );
                              },
                            );

                            reset();
                          } else if (draw == 9) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                });
                                return const AlertDialog(
                                  title: Text('Match is Drawn'),
                                );
                              },
                            );
                            reset();
                          }

                          print(index);
                        });
                      },
                      child: Center(
                        child: Text(listOfGrid[index],
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('What do you Want?'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                return restart();
                              },
                              child: const Text('Restart')),
                          ElevatedButton(
                              onPressed: () {
                                restart();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                              },
                              child: Text('Exit'))
                        ],
                      );
                    },
                  );
                },
                child: const Text('Game Over'))
          ],
        ),
      ),
    );
  }
}
