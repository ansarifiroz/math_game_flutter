import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mathGame/introPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'kids math game',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kalam'),
        home: const IntroPageForImage());
  }
}
