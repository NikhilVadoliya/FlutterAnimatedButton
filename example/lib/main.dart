import 'package:example/helper/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'page/quiz_main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedButtonDemo(),
    );
  }
}

class AnimatedButtonDemo extends StatelessWidget {
  var submitTextStyle = GoogleFonts.nunito(
      fontSize: 28,
      letterSpacing: 5,
      color: Colors.white,
      fontWeight: FontWeight.w100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: submitTextStyle,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                  width: 200,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.TOP_TO_BOTTOM,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                  width: 200,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.RIGHT_TO_LEFT,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                  width: 200,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                width: 200,
                textAlignment: Alignment.center,
                text: 'Tokyo',
                isReverse: true,
                selectedTextColor: ColoursHelper.blue(),
                transitionType: TransitionType.LEFT_TO_RIGHT,
                selectedBackgroundColor: Colors.white,
                textStyle: submitTextStyle,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                textAlignment: Alignment.center,
                text: 'Tokyo',
                isReverse: true,
                selectedTextColor: ColoursHelper.blue(),
                transitionType: TransitionType.RIGHT_TO_LEFT,
                selectedBackgroundColor: Colors.white,
                textStyle: GoogleFonts.nunito(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                textAlignment: Alignment.center,
                text: 'Tokyo',
                isReverse: true,
                selectedTextColor: ColoursHelper.blue(),stripSize: 2,
                transitionType: TransitionType.TOP_TO_BOTTOM,
                selectedBackgroundColor: Colors.white,
                textStyle: GoogleFonts.nunito(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                textAlignment: Alignment.center,
                text: 'Tokyo',
                isReverse: true,
                stripSize: 2,
                selectedTextColor: ColoursHelper.blue(),
                transitionType: TransitionType.BOTTOM_TO_TOP,
                selectedBackgroundColor: Colors.white,
                textStyle: GoogleFonts.nunito(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
