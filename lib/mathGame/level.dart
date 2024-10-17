import 'package:flutter/material.dart';
import 'package:splash_screen/mathGame/mathGame.dart';

class Level extends StatefulWidget {
  final String gameType;
  const Level({super.key, required this.gameType});

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'Select Level',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MathGame(
                                gameType: widget.gameType, levelType: 'easy')),
                      );
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 131, 193, 243),
                          Colors.blueAccent
                        ]),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(minWidth: 200.0),
                        child: const Text(
                          'Easy',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MathGame(
                                gameType: widget.gameType,
                                levelType: 'medium')),
                      );
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.pink, Colors.purple]),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(minWidth: 200.0),
                        child: const Text('Medium',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MathGame(
                                gameType: widget.gameType, levelType: 'hard')),
                      );
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 121, 110, 8),
                          Colors.amber
                        ]),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(minWidth: 200.0),
                        child: const Text('Hard',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
