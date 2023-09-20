import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

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

class AnimatedButtonDemo extends StatefulWidget {
  @override
  _AnimatedButtonDemoState createState() => _AnimatedButtonDemoState();
}

class _AnimatedButtonDemoState extends State<AnimatedButtonDemo> {
  bool isButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedButton(
                animatedOn: AnimatedOn.onHover,
                onPress: () {},
                onChanges: (change) {},
                height: 70,
                reverseAnimation: Duration(milliseconds: 500),
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TOP_ROUNDER,
                backgroundColor: Colors.black,
                selectedBackgroundColor: Colors.lightGreen,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                reverseAnimation: Duration(milliseconds: 500),
                gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                selectedGradientColor: LinearGradient(colors: [Colors.pinkAccent, Colors.purpleAccent]),
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                reverseAnimation: Duration(milliseconds: 500),
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMItT',
                reverseAnimation: Duration(milliseconds: 5000),
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_BOTTOM_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.TOP_CENTER_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton(
                onPress: () {},
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.CENTER_ROUNDER,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderWidth: 1,
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedButton.strip(
                animatedOn: AnimatedOn.onHover,
                height: 70,
                width: 200,
                text: 'SUBMIT',
                isReverse: true,
                selectedTextColor: Colors.black,
                backgroundColor: Colors.black,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
