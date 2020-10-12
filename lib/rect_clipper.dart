import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/helper/transition_type.dart';

class RectClipper extends CustomClipper<Path> {
  final double clipFactor;
  final TransitionType transitionType;

  RectClipper(this.clipFactor, this.transitionType);

  @override
  Path getClip(Size size) {
    Path path = Path();

    switch (transitionType) {
      case TransitionType.LEFT_TO_RIGHT:
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(0.0, size.height);
        break;
      case TransitionType.RIGHT_TO_LEFT:
        path.moveTo(size.width, 0.0);
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(size.width, size.height);
        break;

      case TransitionType.TOP_TO_BOTTOM:
        path.lineTo(0.0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, 0.0);
        break;
      case TransitionType.BOTTOM_TO_TOP:
        path.moveTo(0.0, size.height);
        path.lineTo(0.0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, size.height);

        break;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
