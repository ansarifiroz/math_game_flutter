import 'package:flutter/material.dart';
import 'package:splash_screen/mathGame/chooseGameType.dart';
import 'package:splash_screen/mathGame/textFieldOfKidsFormFill.dart';

class KidsFormFill extends StatefulWidget {
  const KidsFormFill({super.key});

  @override
  State<KidsFormFill> createState() => _KidsFormFillState();
}

class _KidsFormFillState extends State<KidsFormFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/kidsfillFormBackground.jpg'),
              const Column(
                children: [
                  TextFieldOfKidsFormFill(labelText: 'Enter Your Name'),
                  TextFieldOfKidsFormFill(labelText: 'Enter Your Age'),
                  TextFieldOfKidsFormFill(labelText: 'Enter Your Class')
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseGameType()),
                  );
                },
                child: Image.asset(
                  'assets/images/submitButton.png',
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
