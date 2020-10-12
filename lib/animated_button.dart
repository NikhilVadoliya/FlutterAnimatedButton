import 'package:flutter/material.dart';
import 'package:flutter_animated_button/helper/strip_align.dart';
import 'package:flutter_animated_button/helper/transition_type.dart';
import 'package:flutter_animated_button/rect_clipper.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final bool isReverse;
  final int textMaxLine;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final Duration animationDuration;

  // final String number;
  final VoidCallback onPress;
  final TransitionType transitionType;
  final bool isStrip;
  final StripAlign stripAlign;
  final Color stripColor;
  final double stripSize;

  const AnimatedButton(
      {Key key,
      @required this.text,
      // @required this.number,
      this.onPress,
      this.transitionType = TransitionType.LEFT_TO_RIGHT,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.selectedTextColor = Colors.blue,
      this.selectedBackgroundColor = Colors.white,
      this.isReverse = false,
      this.textMaxLine,
      this.textOverflow,
      this.textAlign,
      this.animationDuration = const Duration(milliseconds: 500)})
      : isStrip = false,
        stripAlign = null,
        stripColor = null,
        stripSize = null,
        super(key: key);

  AnimatedButton.strip(Key key,
      {this.text,
      this.isReverse = false,
      this.transitionType = TransitionType.LEFT_TO_RIGHT,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.selectedTextColor = Colors.blue,
      this.selectedBackgroundColor = Colors.white,
      this.textMaxLine,
      this.textOverflow,
      this.textAlign,
      this.animationDuration,
      this.onPress,
      this.stripAlign = StripAlign.LEFT,
      this.stripColor = Colors.white,
      this.stripSize = 60})
      : isStrip = true;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _scaleController;
  Animation<double> slideAnimation;
  Animation scaleAnimation;
  double slideBegin;
  double slideEnd;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 300),
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
    scaleAnimation = Tween(begin: 1.0, end: 0.8).animate(_scaleController);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

    //  print(_controller.value);
    //   return AnimatedBuilder(
    //       animation: _controller,
    //       builder: (context, child) {
    //         print("=---------${_controller.value}-=-=${slideAnimation.value}");
    //
    //         return ClipPath(
    //           clipper: RectClipper(slideAnimation.value, widget.transitionType),
    //           child: InkWell(
    //             onTap: () => _controller.forward(),
    //             child: Container(
    //               width: double.infinity,
    //               height: 50,
    //               color: Colors.red,
    //             ),
    //           ),
    //         );
    //       });
    //
    return InkWell(
      onTap: () {
        if (widget.isReverse && _controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isStrip)
                  Container(
                    width: widget.stripSize,
                    height: 60,
                    color: widget.stripColor,
                  ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.text,
                  maxLines: widget.textMaxLine ?? defaultTextStyle.maxLines,
                  overflow: widget.textOverflow ?? defaultTextStyle.overflow,
                  textAlign: widget.textAlign ?? defaultTextStyle.textAlign,
                  style: widget.textStyle,
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              width: double.infinity,
              color: widget.selectedBackgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 5,
                    height: 60,
                    color: Colors.white70,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // Text(
                  //   widget.number,
                  //   style: GoogleFonts.nunito(
                  //       fontSize: 25, color: ColoursHelper.blue_dark()),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.text,
                    maxLines: widget.textMaxLine ?? defaultTextStyle.maxLines,
                    overflow: widget.textOverflow ?? defaultTextStyle.overflow,
                    textAlign: widget.textAlign ?? defaultTextStyle.textAlign,
                    style: widget.textStyle
                        .copyWith(color: widget.selectedTextColor),
                  )
                ],
              ),
            ),
            builder: (context, child) {
              return ClipPath(
                clipper:
                    RectClipper(slideAnimation.value, widget.transitionType),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
