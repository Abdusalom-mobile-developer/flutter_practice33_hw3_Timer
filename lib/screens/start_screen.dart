import 'package:flutter/material.dart';
import 'package:flutter_practice33_hw3/config/colors.dart';
import 'package:flutter_practice33_hw3/main.dart';
import 'package:flutter_practice33_hw3/mixins/methods.dart';
import 'package:flutter_practice33_hw3/mixins/variables.dart';
import 'package:flutter_practice33_hw3/screens/progress_screen.dart';

class StartScreen extends StatefulWidget {
  static const String id = "start_screen";
  const StartScreen({
    super.key,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with Methods, Variables {
  @override
  void initState() {
    super.initState();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    topArrowButton(function: () {
                      setState(() {
                        if (num1 < 5) {
                          num1++;
                        }
                      });
                    }),
                    topArrowButton(function: () {
                      setState(() {
                        if (num2 < 9) {
                          num2++;
                        }
                      });
                    }),
                  ],
                ),
                Row(children: [
                  topArrowButton(function: () {
                    setState(() {
                      if (num3 < 5) {
                        num3++;
                      }
                    });
                  }),
                  topArrowButton(function: () {
                    setState(() {
                      if (num4 < 9) {
                        num4++;
                      }
                    });
                  })
                ]),
              ],
            ),
            Text(
              "$num1$num2:$num3$num4",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 3.7,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 5),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  downArrowButton(function: () {
                    setState(() {
                      if (num1 > 0) {
                        num1--;
                      }
                    });
                  }),
                  downArrowButton(function: () {
                    setState(() {
                      if (num2 > 0) {
                        num2--;
                      }
                    });
                  }),
                ],
              ),
              Row(
                children: [
                  downArrowButton(function: () {
                    setState(() {
                      if (num3 > 0) {
                        num3--;
                      }
                    });
                  }),
                  downArrowButton(function: () {
                    setState(() {
                      if (num4 > 0) {
                        num4--;
                      }
                    });
                  })
                ],
              )
            ]),
            const SizedBox(
              height: 40,
            ),
            IconButton(
                onPressed: () {
                  MyApp.timerValue = int.parse("$num1$num2$num3$num4");
                  Navigator.pushReplacementNamed(context, ProgressScreen.id);
                },
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  size: 128,
                  color: ColorsClass.black,
                ))
          ],
        ),
      ),
    );
  }
}
