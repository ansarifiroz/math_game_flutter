// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splash_screen/mathGame/dialogbox.dart';
import 'package:splash_screen/mathGame/keyPadButton.dart';

class MathGame extends StatefulWidget {
  final String gameType;
  final String levelType;
  const MathGame({super.key, required this.gameType, required this.levelType});

  @override
  State<MathGame> createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];
  List<String> fixedTimer = ['1min', '2min', '3min', '5min', '10min'];
  var userAnswer = '';
  int noOne = 1;
  int noTwo = 1;
  var buttonValue = '';
  int timerMaxSeconds = 0;
  int score = 0;
  int currentSeconds = 0;
  int pause = 0;
  var gameTypeColor = Colors.white;
  var scoreColor = Colors.white;
  late String operatorsSymbol;
  Random randomNumber = Random();
  String get timerText =>
      ' ${((timerMaxSeconds - currentSeconds)).toString().padLeft(3, '0')}';

  late Timer timer1;
  startTimeout() {
    var duration = const Duration(seconds: 1);

    Timer.periodic(duration, (timer) {
      timer1 = timer;
      setState(() {
        currentSeconds = timer.tick;

        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    if (widget.gameType == 'plus') {
      gameTypeColor = Color.fromARGB(255, 123, 255, 7);
      scoreColor = Colors.blue;
      operatorsSymbol = '+';
    } else if (widget.gameType == 'minus') {
      gameTypeColor = Color.fromARGB(255, 216, 41, 222);
      scoreColor = Colors.white;
      operatorsSymbol = '-';
    } else if (widget.gameType == 'multiplication') {
      gameTypeColor = Color.fromARGB(255, 230, 46, 123);
      scoreColor = Colors.white;
      operatorsSymbol = 'x';
    } else if (widget.gameType == 'division') {
      scoreColor = Colors.white;
      gameTypeColor = Color.fromARGB(255, 46, 239, 197);
      operatorsSymbol = '÷';
    }

    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    startTimeout();
  }

  void onPressedDialog(value) {
    if (value == 'correct') {
      allLevel(widget.gameType);
      score += 5;
      userAnswer = '';
      Navigator.pop(context);
    } else if (value == 'incorrect') {
      userAnswer = '';
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
    setState(() {});
  }

  void allLevel(value) {
    if (value == 'plus') {
      if (widget.levelType == 'easy') {
        noOne = randomNumber.nextInt(10);
        noTwo = randomNumber.nextInt(10);
      } else if (widget.levelType == 'medium') {
        noOne = randomNumber.nextInt(50);
        noTwo = randomNumber.nextInt(50);
      } else if (widget.levelType == 'hard') {
        noOne = randomNumber.nextInt(150);
        noTwo = randomNumber.nextInt(150);
      }
    } else if (value == 'multiplication') {
      if (widget.levelType == 'easy') {
        noOne = randomNumber.nextInt(5);
        noTwo = randomNumber.nextInt(5);
      } else if (widget.levelType == 'medium') {
        noOne = randomNumber.nextInt(15);
        noTwo = randomNumber.nextInt(15);
      } else if (widget.levelType == 'hard') {
        noOne = randomNumber.nextInt(30);
        noTwo = randomNumber.nextInt(43);
      }
    } else if (value == 'minus') {
      if (widget.levelType == 'easy') {
        noOne = randomNumber.nextInt(10) + 5;
        noTwo = randomNumber.nextInt(5);
      } else if (widget.levelType == 'medium') {
        noOne = randomNumber.nextInt(50) + 30;
        noTwo = randomNumber.nextInt(30);
      } else if (widget.levelType == 'hard') {
        noOne = randomNumber.nextInt(80) + 80;
        noTwo = randomNumber.nextInt(80);
      }
    } else if (value == 'division') {
      if (widget.levelType == 'easy') {
        noOne = randomNumber.nextInt(30) * 2;
        noTwo = 2;
      } else if (widget.levelType == 'medium') {
        noOne = randomNumber.nextInt(80) * 2 + 2;
        noTwo = 2;
      } else if (widget.levelType == 'hard') {
        noOne = randomNumber.nextInt(200) * 2 + 2;
        noTwo = 2;
      }
    }
  }

  void buttonTapped(button) {
    if (buttonValue != '') {
      if (int.parse(timerText) != pause) {
        if (button == '=') {
          correctOrIncorrectDialog();
        } else if (button == 'C') {
          userAnswer = '';
        } else if (button == 'DEL') {
          if (userAnswer.isNotEmpty) {
            userAnswer = userAnswer.substring(0, userAnswer.length - 1);
          }
        } else if (userAnswer.length < 3) {
          userAnswer += button;
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog(''),
                  title: 'Please Continue the Game',
                  dialogCorrectOrIncorrect: '',
                  gameTypeColor: gameTypeColor,
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => DialogBox(
              onpressed: () => onPressedDialog(''),
              gameTypeColor: gameTypeColor,
              dialogCorrectOrIncorrect: '',
              title: 'Please Select Duration '));
    }

    setState(() {});
  }

  void correctOrIncorrectDialog() {
    if (widget.gameType == 'plus') {
      if (noOne + noTwo == int.parse(userAnswer)) {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('correct'),
                  title: 'Correct!',
                  dialogCorrectOrIncorrect: 'correct',
                  gameTypeColor: gameTypeColor,
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('incorrect'),
                  title: 'InCorrect!',
                  dialogCorrectOrIncorrect: 'incorrect',
                  gameTypeColor: gameTypeColor,
                ));
      }
    } else if (widget.gameType == 'multiplication') {
      if (noOne * noTwo == int.parse(userAnswer)) {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('correct'),
                  title: 'Correct!',
                  dialogCorrectOrIncorrect: 'correct',
                  gameTypeColor: gameTypeColor,
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('incorrect'),
                  title: 'InCorrect!',
                  dialogCorrectOrIncorrect: 'incorrect',
                  gameTypeColor: gameTypeColor,
                ));
      }
    } else if (widget.gameType == 'minus') {
      if (noOne - noTwo == int.parse(userAnswer)) {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('correct'),
                  title: 'Correct!',
                  dialogCorrectOrIncorrect: 'correct',
                  gameTypeColor: gameTypeColor,
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('incorrect'),
                  title: 'InCorrect!',
                  dialogCorrectOrIncorrect: 'incorrect',
                  gameTypeColor: gameTypeColor,
                ));
      }
    } else if (widget.gameType == 'division') {
      if (noOne / noTwo == int.parse(userAnswer)) {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('correct'),
                  title: 'Correct!',
                  dialogCorrectOrIncorrect: 'correct',
                  gameTypeColor: gameTypeColor,
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => DialogBox(
                  onpressed: () => onPressedDialog('incorrect'),
                  title: 'InCorrect!',
                  dialogCorrectOrIncorrect: 'incorrect',
                  gameTypeColor: gameTypeColor,
                ));
      }
    }
  }

  var onSelectButtonColor = Colors.white;

  void fixedTimerFunction(timerButton) {
    buttonValue = timerButton;
    if (timerButton == '1min') {
      passMinute(60);
    } else if (timerButton == '2min') {
      passMinute(120);
    } else if (timerButton == '3min') {
      passMinute(180);
    } else if (timerButton == '5min') {
      passMinute(300);
    } else if (timerButton == '10min') {
      passMinute(600);
    }
    setState(() {});
  }

  void passMinute(minute) {
    timer1.cancel();
    currentSeconds = 0;
    timerMaxSeconds = minute;
    startTimeout();
  }

  void startPauseContinue(value) {
    if (value == 'startgame') {
      timer1.cancel();
      fixedTimerFunction(buttonValue);
      score = 0;
    } else if (value == 'pause') {
      timer1.cancel();
      pause = int.parse(timerText);
    } else if (value == 'continue') {
      timerMaxSeconds = int.parse(timerText);
      startTimeout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(0.5),
      backgroundColor: Color.fromARGB(255, 41, 40, 40),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              color: gameTypeColor,
              height: 190,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: fixedTimer.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              fixedTimerFunction(fixedTimer[index]);
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: buttonValue == fixedTimer[index]
                                        ? Color.fromARGB(255, 48, 48, 48)
                                        : Color.fromARGB(255, 228, 180, 4),
                                    spreadRadius: 0,
                                    blurRadius: buttonValue == fixedTimer[index]
                                        ? 15
                                        : 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                fixedTimer[index],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                startPauseContinue('startgame');
                              },
                              child: const Text(
                                'Start Game',
                                style: TextStyle(fontSize: 15),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    startPauseContinue('pause');
                                  },
                                  child: const Text(
                                    'Pause',
                                    style: TextStyle(fontSize: 15),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      startPauseContinue('continue');
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(fontSize: 15),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        timerText,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        'Score- $score',
                        style: TextStyle(
                            fontSize: 30,
                            color: scoreColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$noOne $operatorsSymbol $noTwo = ',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 50,
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    userAnswer,
                    style: const TextStyle(fontSize: 40),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: numberPad.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return KeyPadButton(
                      child: numberPad[index],
                      onTap: () => buttonTapped(numberPad[index]),
                      equaltoColor: gameTypeColor);
                },
              ))
        ],
      ),
    );
  }
}
