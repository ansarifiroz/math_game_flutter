import 'package:flutter/material.dart';

class KeyPadButton extends StatefulWidget {
  final String child;
  final VoidCallback onTap;
  final Color equaltoColor;
  const KeyPadButton(
      {super.key,
      required this.child,
      required this.onTap,
      required this.equaltoColor});

  @override
  State<KeyPadButton> createState() => _KeyPadButtonState();
}

class _KeyPadButtonState extends State<KeyPadButton> {
  var buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    if (widget.child == 'DEL') {
      buttonColor = const Color.fromARGB(255, 255, 89, 77);
    } else if (widget.child == 'C') {
      buttonColor = const Color.fromARGB(255, 3, 213, 112);
    } else if (widget.child == '=') {
      buttonColor = widget.equaltoColor;
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 75, 75, 75),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.child.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
