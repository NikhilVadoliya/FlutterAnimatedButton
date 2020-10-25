import 'package:flutter/material.dart';
import 'package:flutter_animated_button/helper/strip_align.dart';
import 'package:flutter_animated_button/helper/transition_type.dart';
import 'package:flutter_animated_button/rect_clipper.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final Color unSelectedBackgroundColor;
  final bool isReverse;
  final int textMaxLine;
  final TextOverflow textOverflow;
  final AlignmentGeometry textAlignment;
  final Duration animationDuration;
  final double width;
  final double height;
  final VoidCallback onPress;
  final TransitionType transitionType;
  final bool isStrip;

  final Color stripColor;
  final double stripSize;

  const AnimatedButton(
      {Key key,
      @required this.text,
      this.onPress,
      this.transitionType = TransitionType.LEFT_TO_RIGHT,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.selectedTextColor = Colors.blue,
      this.selectedBackgroundColor = Colors.white,
      this.unSelectedBackgroundColor = Colors.white24,
      this.isReverse = false,
      this.textMaxLine,
      this.textOverflow,
      this.textAlignment = Alignment.center,
      this.height = 50,
      this.width = double.infinity,
      this.animationDuration = const Duration(milliseconds: 500)})
      : assert(text != null),
        isStrip = false,
        stripColor = null,
        stripSize = null,
        super(key: key);

  AnimatedButton.strip(
      {Key key,
      this.text,
      this.isReverse = false,
      this.height = 50,
      this.width = double.infinity,
      this.transitionType = TransitionType.LEFT_TO_RIGHT,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.selectedTextColor = Colors.blue,
      this.selectedBackgroundColor = Colors.white,
      this.textMaxLine,
      this.textOverflow,
      this.textAlignment = Alignment.center,
      this.animationDuration = const Duration(milliseconds: 500),
      this.onPress,
      this.unSelectedBackgroundColor = Colors.white24,
      this.stripColor = Colors.white,
      this.stripSize = 6})
      : assert(text != null),
        isStrip = true;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> slideAnimation;
  Animation scaleAnimation;
  double slideBegin;
  double slideEnd;

  // return animationController of check status and animation
  AnimationController get animationController => _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (widget.transitionType == TransitionType.RIGHT_TO_LEFT ||
        widget.transitionType == TransitionType.BOTTOM_TO_TOP) {
      slideBegin = 1.0;
      slideEnd = 0.0;
    } else {
      slideBegin = 0.0;
      slideEnd = 1.0;
    }
    slideAnimation =
        Tween(begin: slideBegin, end: slideEnd).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    // unselected/normal text
    var textNormal = Text(
      widget.text,
      maxLines: widget.textMaxLine ?? defaultTextStyle.maxLines,
      overflow: widget.textOverflow ?? defaultTextStyle.overflow,
      style: widget.textStyle,
    );
    // selected text
    var textSelected = Text(
      widget.text,
      maxLines: widget.textMaxLine ?? defaultTextStyle.maxLines,
      overflow: widget.textOverflow ?? defaultTextStyle.overflow,
      style: widget.textStyle.copyWith(color: widget.selectedTextColor),
    );

    var selectedButtonClick = InkWell(
      onTap: () {
        if (widget.isReverse && _controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: textSelected,
    );
    var normalButtonClick = InkWell(
      onTap: () {
        if (widget.isReverse && _controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: textSelected,
    );

    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          color: widget.unSelectedBackgroundColor,
          child: widget.isStrip
              ? StripAnimated(
                  stripAlign: widget.transitionType,
                  stripColor: widget.stripColor,
                  stripSize: widget.stripSize,
                  text: textNormal,
                  onTap: () => onButtonClick(),
                  textAlignment: widget.textAlignment,
                )
              : InkWell(
                  onTap: () => onButtonClick(),
                  child: Align(
                    child: textNormal,
                    alignment: widget.textAlignment,
                  ),
                ),
        ),
        AnimatedBuilder(
          animation: _controller,
          child: Container(
              width: widget.width,
              height: widget.height,
              color: widget.selectedBackgroundColor,
              child: widget.isStrip
                  ? StripAnimated(
                      stripAlign: widget.transitionType,
                      stripColor: widget.stripColor,
                      stripSize: widget.stripSize,
                      text: textSelected,
                      onTap: () => onButtonClick(),
                      textAlignment: widget.textAlignment,
                    )
                  : InkWell(
                      onTap: () => onButtonClick(),
                      child: Align(
                        child: textSelected,
                        alignment: widget.textAlignment,
                      ),
                    )),
          builder: (context, child) {
            return ClipPath(
              clipper: RectClipper(slideAnimation.value, widget.transitionType),
              child: child,
            );
          },
        ),
      ],
    );
  }

  onButtonClick() {
    if (widget.isReverse && _controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}

class StripAnimated extends StatelessWidget {
  final TransitionType stripAlign;
  final Color stripColor;
  final double stripSize;
  final Text text;
  final VoidCallback onTap;
  final AlignmentGeometry textAlignment;

  const StripAnimated(
      {Key key,
      this.stripAlign,
      this.stripColor,
      this.stripSize,
      this.text,
      this.textAlignment,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (stripAlign == TransitionType.BOTTOM_TO_TOP ||
        stripAlign == TransitionType.TOP_TO_BOTTOM) {
      return Column(
        children: [
          if (stripAlign == TransitionType.TOP_TO_BOTTOM)
            Container(
              width: double.infinity,
              height: stripSize,
              color: stripColor,
            ),
          Expanded(
            child: InkWell(
              onTap: () => onTap(),
              child: Padding(
                padding: EdgeInsets.only(
                    top: stripAlign == TransitionType.TOP_TO_BOTTOM
                        ? 0
                        : stripSize,
                    bottom: stripAlign == TransitionType.BOTTOM_TO_TOP
                        ? 0
                        : stripSize),
                child: Align(
                  child: text,
                  alignment: textAlignment,
                ),
              ),
            ),
          ),
          if (stripAlign == TransitionType.BOTTOM_TO_TOP)
            Container(
              width: double.infinity,
              height: stripSize,
              color: stripColor,
            ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (stripAlign == TransitionType.LEFT_TO_RIGHT)
            Container(
              width: stripSize,
              height: double.infinity,
              color: stripColor,
            ),
          Expanded(
            child: InkWell(
              onTap: () => onTap(),
              child: Align(
                child: text,
                alignment: textAlignment,
              ),
            ),
          ),
          if (stripAlign == TransitionType.RIGHT_TO_LEFT)
            Container(
              width: stripSize,
              height: double.infinity,
              color: stripColor,
            ),
        ],
      );
    }
  }
}
