import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonDemoScreen extends StatelessWidget {
  const ButtonDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildAnimatedButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedButtons() {
    final submitTextStyle = GoogleFonts.nunito(
      fontSize: 28,
      letterSpacing: 5,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    );

    final buttonConfigurations = [
      _ButtonConfig(
          transitionType: TransitionType.LEFT_TOP_ROUNDER,
          animatedOn: AnimatedOn.onHover,
          backgroundColor: Colors.lightGreen),
      _ButtonConfig(
        transitionType: TransitionType.LEFT_CENTER_ROUNDER,
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        selectedGradientColor: LinearGradient(
          colors: [Colors.pinkAccent, Colors.purpleAccent],
        ),
      ),
      _ButtonConfig(transitionType: TransitionType.LEFT_BOTTOM_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.RIGHT_TOP_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.RIGHT_CENTER_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.RIGHT_BOTTOM_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.TOP_CENTER_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.BOTTOM_CENTER_ROUNDER),
      _ButtonConfig(transitionType: TransitionType.CENTER_ROUNDER),
      _ButtonConfig(
        isStrip: true,
        animatedOn: AnimatedOn.onTap,
      ),
    ];

    return buttonConfigurations
        .expand((config) => [
              _buildAnimatedButton(
                textStyle: submitTextStyle,
                transitionType: config.transitionType,
                animatedOn: config.animatedOn,
                backgroundColor: config.backgroundColor,
                gradient: config.gradient,
                selectedGradientColor: config.selectedGradientColor,
                isStrip: config.isStrip,
              ),
              const SizedBox(height: 50),
            ])
        .toList();
  }

  Widget _buildAnimatedButton(
      {required TextStyle textStyle,
      TransitionType? transitionType,
      AnimatedOn? animatedOn,
      Color? backgroundColor,
      LinearGradient? gradient,
      LinearGradient? selectedGradientColor,
      bool isStrip = false,
      VoidCallback? onPressed}) {
    if (isStrip) {
      return AnimatedButton.strip(
        animatedOn: animatedOn ?? AnimatedOn.onTap,
        height: 70,
        width: 200,
        text: 'SUBMIT SUBMIT',
        isReverse: true,
        selectedTextColor: Colors.black,
        textStyle: textStyle,
        backgroundColor: Colors.black,
        onPress: onPressed,
      );
    }

    return AnimatedButton(
      animatedOn: animatedOn ?? AnimatedOn.onTap,
      onPress: onPressed,
      height: 70,
      width: 200,
      text: 'SUBMIT SUBMIT SUBMIT SUBMIT',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: transitionType ?? TransitionType.BOTTOM_CENTER_ROUNDER,
      textStyle: textStyle,
      backgroundColor: backgroundColor ?? Colors.black,
      selectedBackgroundColor: backgroundColor ?? Colors.white,
      gradient: gradient,
      selectedGradientColor: selectedGradientColor,
      borderColor: Colors.white,
      borderWidth: 1,
    );
  }
}

class _ButtonConfig {
  final TransitionType? transitionType;
  final AnimatedOn? animatedOn;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final LinearGradient? selectedGradientColor;
  final bool isStrip;

  const _ButtonConfig(
      {this.transitionType,
      this.animatedOn,
      this.backgroundColor,
      this.gradient,
      this.selectedGradientColor,
      this.isStrip = false});
}
