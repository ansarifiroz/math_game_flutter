import 'package:flutter/material.dart';
import 'package:splash_screen/mathGame/kidsformFill.dart';

class IntroPageForImage extends StatefulWidget {
  const IntroPageForImage({super.key});

  @override
  State<IntroPageForImage> createState() => _IntroPageForImageState();
}

class _IntroPageForImageState extends State<IntroPageForImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/mathGame.webp',
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(50),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KidsFormFill()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/nextButton.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
