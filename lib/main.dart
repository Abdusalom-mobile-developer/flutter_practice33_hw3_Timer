import 'package:flutter/material.dart';

import 'package:flutter_practice33_hw3/screens/progress_screen.dart';
import 'package:flutter_practice33_hw3/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static int timerValue = 0;
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      routes: {
        StartScreen.id: (context) => StartScreen(),
        ProgressScreen.id: (context) => ProgressScreen(
              timerValue: MyApp.timerValue,
            )
      },
    );
  }
}
