import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_button/helper/transition_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/colors_helper.dart';

class OptionList extends StatefulWidget {
  @override
  _OptionListState createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColoursHelper.blue(), ColoursHelper.blue_dark()])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*  AnimatedButton(
              text: 'London',
              isReverse: true,
              selectedTextColor: ColoursHelper.blue(),
              transitionType: TransitionType.BOTTOM_TO_TOP,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedButton(
              text: 'New York',
              isReverse: true,
              selectedTextColor: ColoursHelper.blue(),
              transitionType: TransitionType.TOP_TO_BOTTOM,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedButton(
              text: 'Paris',
              isReverse: true,
              selectedTextColor: ColoursHelper.blue(),
              transitionType: TransitionType.RIGHT_TO_LEFT,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedButton(
              text: 'Paris',
              isReverse: true,
              selectedTextColor: ColoursHelper.blue(),
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),*/

            AnimatedButton.strip(
              textAlignment: Alignment.center,
              text: 'Tokyo',
              isReverse: true,
              selectedTextColor: ColoursHelper.blue(),
              transitionType: TransitionType.LEFT_TO_RIGHT,
              selectedBackgroundColor: Colors.white,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
        ));
  }
}
