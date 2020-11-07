import 'package:example/helper/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    var submitTextStyle = GoogleFonts.nunito(
        fontSize: 28,
        letterSpacing: 5,
        color: Colors.white,
        fontWeight: FontWeight.w300);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderRadius: 0,
                borderWidth: 2,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.TOP_TO_BOTTOM,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: null,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_TO_LEFT,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                  width: 200,
                  height: 70,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  stripTransitionType: StripTransitionType.LEFT_TO_RIGHT,
                  selectedBackgroundColor: Colors.white,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                  width: 200,
                  height: 70,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  stripTransitionType: StripTransitionType.RIGHT_TO_LEFT,
                  selectedBackgroundColor: Colors.white,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                  width: 200,
                  height: 70,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  stripTransitionType: StripTransitionType.TOP_TO_BOTTOM,
                  selectedBackgroundColor: Colors.white,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                  width: 200,
                  height: 70,
                  text: 'SUBMIT',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  stripTransitionType: StripTransitionType.BOTTOM_TO_TOP,
                  selectedBackgroundColor: Colors.white,
                  textStyle: submitTextStyle),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
