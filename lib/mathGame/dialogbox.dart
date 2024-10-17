import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  final VoidCallback onpressed;
  final String title;
  final Color gameTypeColor;
  final String dialogCorrectOrIncorrect;
  const DialogBox(
      {super.key,
      required this.onpressed,
      required this.title,
      required this.gameTypeColor,
      required this.dialogCorrectOrIncorrect});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  var dialogBackGoroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    if (widget.dialogCorrectOrIncorrect == 'correct') {
      dialogBackGoroundColor = widget.gameTypeColor;
    } else if (widget.dialogCorrectOrIncorrect == 'incorrect') {
      dialogBackGoroundColor = Colors.red;
    } else {
      dialogBackGoroundColor = Colors.white;
    }
    return AlertDialog(
      // backgroundColor: Colors.amber.withOpacity(1),
      backgroundColor: dialogBackGoroundColor,
      content: Container(
          alignment: AlignmentDirectional.center,
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 45),
              ),
              SizedBox(
                height: 60,
                width: 80,
                // color: Colors.white.withOpacity(0.3),
                child: IconButton(
                    onPressed: widget.onpressed,
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: Colors.black,
                    )),
              )
            ],
          )),
    );
  }
}
