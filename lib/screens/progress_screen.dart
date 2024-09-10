import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice33_hw3/config/colors.dart';
import 'package:flutter_practice33_hw3/main.dart';
import 'package:flutter_practice33_hw3/screens/start_screen.dart';

// ignore: must_be_immutable
class ProgressScreen extends StatefulWidget {
  static const String id = "progress_screen";
  int timerValue;
  ProgressScreen({super.key, required this.timerValue});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  // ignore: unused_field
  late Timer _timer;
  bool isPaused = false;
  String converted = MyApp.timerValue.toString().padLeft(4, "0");
  int num1 = 0;
  int num2 = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    num1 = int.parse(converted[0] + converted[1]);
    num2 = int.parse(converted[2] + converted[3]);
  }

  final player = AudioPlayer();

  playAudio() async {
    await player.play(AssetSource("audios/notification_sound.mp3"));
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (num2 > 0) {
          num2--;
          if (num2 == 0 && num1 > 0) {
            num2 = 59;
            num1--;
            if (num2 == 0 && num1 == 0) {
              playAudio();
              Navigator.pushReplacementNamed(context, StartScreen.id);
            }
          }
        } else if (num2 == 0 && num1 == 0) {
          playAudio();
          Navigator.pushReplacementNamed(context, StartScreen.id);
        } else if (num2 == 0 && num1 > 0) {
          num2 = 59;
          num1--;
          if (num2 == 0 && num1 == 0) {
            playAudio();
            Navigator.pushReplacementNamed(context, StartScreen.id);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // "$num1$num2:$num3$num4",
              "${num1.toString().padLeft(2, "0")}:${num2.toString().padLeft(2, "0")}",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 3.7,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 5),
            ),
            const SizedBox(
              height: 40,
            ),
            isPaused
                ? IconButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isPaused = false;
                      });
                    },
                    icon: const Icon(
                      Icons.play_arrow_sharp,
                      size: 128,
                    ))
                : IconButton(
                    onPressed: () {
                      _timer.cancel();
                      setState(() {
                        isPaused = true;
                      });
                    },
                    icon: const Icon(
                      Icons.pause,
                      size: 128,
                    ))
          ],
        ),
      ),
    );
  }
}











