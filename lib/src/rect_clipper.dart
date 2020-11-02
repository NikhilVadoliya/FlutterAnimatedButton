import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/src/transition_type.dart';

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
      case TransitionType.CENTER_LR_IN:
        break;
      case TransitionType.CENTER_TB_IN:
        // TODO: Handle this case.
        break;
      case TransitionType.CENTER_LR_OUT:
        var halfWidth = size.width / 2;
        path.moveTo(halfWidth, 0.0);
        path.lineTo(halfWidth - (halfWidth * clipFactor), 0);
        path.lineTo(halfWidth - (halfWidth * clipFactor), size.height);
        path.lineTo(halfWidth + (halfWidth * clipFactor), size.height);
        path.lineTo(halfWidth + (halfWidth * clipFactor), 0);
        break;
      case TransitionType.CENTER_TB_OUT:
        // TODO: Handle this case.
        break;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class RectStripClipper extends CustomClipper<Path> {
  final double clipFactor;
  final StripTransitionType transitionType;

  RectStripClipper(this.clipFactor, this.transitionType);

  @override
  Path getClip(Size size) {
    Path path = Path();

    switch (transitionType) {
      case StripTransitionType.LEFT_TO_RIGHT:
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(0.0, size.height);
        break;
      case StripTransitionType.RIGHT_TO_LEFT:
        path.moveTo(size.width, 0.0);
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(size.width, size.height);
        break;

      case StripTransitionType.TOP_TO_BOTTOM:
        path.lineTo(0.0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, 0.0);
        break;
      case StripTransitionType.BOTTOM_TO_TOP:
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
