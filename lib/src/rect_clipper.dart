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
        path.moveTo(size.width / 2 * clipFactor, 0);
        path.lineTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(size.width - (size.width / 2 * clipFactor), 0);
        path.lineTo(size.width - (size.width / 2 * clipFactor), size.height);
        path.lineTo(size.width / 2 * clipFactor, size.height);

        break;
      case TransitionType.CENTER_TB_IN:
        path.moveTo(0, size.height / 2 * clipFactor);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height / 2 * clipFactor);
        path.lineTo(0, size.height / 2 * clipFactor);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, size.height - (size.height / 2 * clipFactor));
        path.lineTo(0, size.height - (size.height / 2 * clipFactor));
        break;
      case TransitionType.CENTER_LR_OUT:
        var halfWidth = size.width / 2;
        var clipFactorWidth = halfWidth * clipFactor;
        path.moveTo(halfWidth, 0.0);
        path.lineTo(halfWidth - clipFactorWidth, 0);
        path.lineTo(halfWidth - clipFactorWidth, size.height);
        path.lineTo(halfWidth + clipFactorWidth, size.height);
        path.lineTo(halfWidth + clipFactorWidth, 0);
        break;
      case TransitionType.CENTER_TB_OUT:
        var halfHeight = size.height / 2;
        var clipFactorHeight = halfHeight * clipFactor;
        path.moveTo(0.0, halfHeight);
        path.lineTo(0, halfHeight - clipFactorHeight);
        path.lineTo(size.width, halfHeight - clipFactorHeight);
        path.lineTo(size.width, halfHeight + clipFactorHeight);
        path.lineTo(0.0, halfHeight + clipFactorHeight);
        break;
      case TransitionType.LEFT_TOP_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, 0),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.LEFT_BOTTOM_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, size.height),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.LEFT_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, size.height / 2),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.RIGHT_BOTTOM_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, size.height),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.RIGHT_TOP_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, 0),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.RIGHT_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, size.height / 2),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.TOP_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, 0),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.BOTTOM_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, size.height),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
        break;
      case TransitionType.CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: clipFactor > 0.9
                ? size.width * clipFactor + 10
                : size.width * clipFactor));
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
