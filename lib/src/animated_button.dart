import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/src/rect_clipper.dart';
import 'package:flutter_animated_button/src/transition_type.dart';

class AnimatedButton extends StatefulWidget {
  /// [String] text of button
  final String text;

  /// [TextStyle] textStyle of button's text
  final TextStyle textStyle;

  /// [Color] text colour which displaying  when the user press on the button / select it
  final Color selectedTextColor;

  /// [Color] button background colour which displaying
  /// when the user press on button / select it
  final Color selectedBackgroundColor;

  ///[Color] button background colour which displaying when
  ///the user deselect button
  final Color backgroundColor;

  /// [bool] [true] - you can select and deselect button after select/deselect it
  /// [false] - you can't deselect it after select it.
  /// by Default is [false]
  final bool isReverse;

  ///[bool]  [true] - user can interact with button and called onPress function
  ///when user click on it. [false] - user can interact with button.
  final bool enable;

  // An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int textMaxLine;

  /// How visual overflow should be handled.
  ///
  /// Defaults to retrieving the value from the nearest [DefaultTextStyle] ancestor.
  final TextOverflow textOverflow;

  /// The x and y values of the [Alignment] control the horizontal and vertical
  /// alignment, respectively. An x value of -1.0 means that the left edge of
  /// the child is aligned with the left edge of the parent whereas an x value
  /// of 1.0 means that the right edge of the child is aligned with the right
  /// edge of the parent. Other values interpolate (and extrapolate) linearly.
  /// For example, a value of 0.0 means that the center of the child is aligned
  /// with the center of the parent.
  ///
  /// See also:
  ///
  ///  * [Alignment], which has more details and some convenience constants for
  ///    common positions.
  ///  * [AlignmentDirectional], which has a horizontal coordinate orientation
  ///    that depends on the [TextDirection].
  final AlignmentGeometry textAlignment;

  /// [Duration] animation duration on button
  /// By default it is 500 ms
  final Duration animationDuration;

  ///[double] width of button
  ///by default it is double.infinity
  final double width;

  ///[double] height of button
  ///by default it is 50
  final double height;

  /// Adds the onTap [VoidCallback] to the animated button.
  final VoidCallback onPress;

  /// called this function when user press on button and pass value of button
  /// [true] - button selected
  /// [false] - button deSelected
  final ValueChanged<bool> onChanges;

  /// [TransitionType]  type of animation which apply to Button
  /// by Default it is TransitionType.LEFT_TO_RIGHT
  final TransitionType transitionType;

  /// [StripTransitionType]  type of animation which apply to Strip Button
  /// by Default it is TransitionType.LEFT_TO_RIGHT
  final StripTransitionType stripTransitionType;

  /// [bool] this value will be [true] when user used [AnimatedButton] widget
  /// [false] when user used [AnimatedButton.strip] widget
  /// user can change this value
  final bool isStrip;

  ///[Color] color of strip which used in [AnimatedButton.strip] widget
  final Color stripColor;

  ///[double] size of strip it will use width when used [TransitionType.LEFT_TO_RIGHT]
  ///or [TransitionType.RIGHT_TO_LEFT] animation and it will use height when used
  /// [TransitionType.BOTTOM_TO_TOP] or [TransitionType.TOP_TO_BOTTOM]
  final double stripSize;

  //button border
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  final Gradient gradient;
  final Gradient selectedGradientColor;

  const AnimatedButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.transitionType = TransitionType.LEFT_TO_RIGHT,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
    this.selectedTextColor = Colors.blue,
    this.selectedBackgroundColor = Colors.white,
    this.backgroundColor = Colors.white24,
    this.isReverse = false,
    this.textMaxLine,
    this.textOverflow,
    this.textAlignment = Alignment.center,
    this.height = 50,
    this.width = double.infinity,
    this.animationDuration = const Duration(milliseconds: 500),
    this.enable = true,
    this.onChanges,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.gradient,
    this.selectedGradientColor,
  })  : assert(text != null),
        isStrip = false,
        stripColor = null,
        stripSize = null,
        stripTransitionType = null,
        super(key: key);

  AnimatedButton.strip(
      {Key key,
      @required this.text,
      @required this.onPress,
      this.isReverse = false,
      this.height = 50,
      this.width = double.infinity,
      this.stripTransitionType = StripTransitionType.LEFT_TO_RIGHT,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.selectedTextColor = Colors.blue,
      this.selectedBackgroundColor = Colors.white,
      this.textMaxLine,
      this.textOverflow,
      this.textAlignment = Alignment.center,
      this.animationDuration = const Duration(milliseconds: 500),
      this.backgroundColor = Colors.white24,
      this.stripColor = Colors.white,
      this.stripSize = 6,
      this.enable = true,
      this.onChanges,
      this.gradient,
      this.selectedGradientColor})
      : assert(text != null),
        borderRadius = 0,
        borderWidth = 0,
        borderColor = Colors.transparent,
        transitionType = null,
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

  /// [return] animationController of check status and animation
  AnimationController get animationController => _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.isStrip) {
      if (widget.stripTransitionType == StripTransitionType.RIGHT_TO_LEFT ||
          widget.stripTransitionType == StripTransitionType.BOTTOM_TO_TOP) {
        slideBegin = 1.0;
        slideEnd = 0.0;
      } else {
        slideBegin = 0.0;
        slideEnd = 1.0;
      }
    } else {
      if (widget.transitionType == TransitionType.RIGHT_TO_LEFT ||
          widget.transitionType == TransitionType.BOTTOM_TO_TOP) {
        slideBegin = 1.0;
        slideEnd = 0.0;
      } else {
        slideBegin = 0.0;
        slideEnd = 1.0;
      }
    }
    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    slideAnimation = Tween(begin: slideBegin, end: slideEnd).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    // deSelected/normal text
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

    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          // color: widget.backgroundColor,
          decoration: BoxDecoration(
            gradient: widget?.gradient,
            color: widget.backgroundColor,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: widget.isStrip
              ? StripAnimated(
                  animationType: widget.stripTransitionType,
                  stripColor: widget.stripColor,
                  stripSize: widget.stripSize,
                  text: textNormal,
                  onTap: () => onButtonClick(),
                  textAlignment: widget.textAlignment,
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
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
              decoration: BoxDecoration(
                gradient: widget?.selectedGradientColor,
                color: widget.selectedBackgroundColor,
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.isStrip
                  ? StripAnimated(
                      animationType: widget.stripTransitionType,
                      stripColor: widget.stripColor,
                      stripSize: widget.stripSize,
                      text: textSelected,
                      onTap: () => onButtonClick(),
                      textAlignment: widget.textAlignment,
                    )
                  : InkWell(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      onTap: () => onButtonClick(),
                      child: Align(
                        child: textSelected,
                        alignment: widget.textAlignment,
                      ),
                    )),
          builder: (context, child) {
            return ClipPath(
              clipper: widget.isStrip
                  ? RectStripClipper(
                      slideAnimation.value, widget.stripTransitionType)
                  : RectClipper(slideAnimation.value, widget.transitionType),
              child: child,
            );
          },
        ),
      ],
    );
  }

  onButtonClick() {
    if (widget.enable) {
      if (widget.isReverse && _controller.isCompleted) {
        _controller.reverse();
        widget.onChanges(false);
      } else {
        _controller.forward();
        widget.onChanges(true);
      }
      widget.onPress();
    }
  }
}

class StripAnimated extends StatelessWidget {
  final StripTransitionType animationType;
  final Color stripColor;
  final double stripSize;
  final Text text;
  final VoidCallback onTap;
  final AlignmentGeometry textAlignment;

  const StripAnimated(
      {Key key,
      this.animationType,
      this.stripColor,
      this.stripSize,
      this.text,
      this.textAlignment,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (animationType == StripTransitionType.BOTTOM_TO_TOP ||
        animationType == StripTransitionType.TOP_TO_BOTTOM) {
      return Column(
        children: [
          if (animationType == StripTransitionType.TOP_TO_BOTTOM)
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
                    top: animationType == StripTransitionType.TOP_TO_BOTTOM
                        ? 0
                        : stripSize,
                    bottom: animationType == StripTransitionType.BOTTOM_TO_TOP
                        ? 0
                        : stripSize),
                child: Align(
                  child: text,
                  alignment: textAlignment,
                ),
              ),
            ),
          ),
          if (animationType == StripTransitionType.BOTTOM_TO_TOP)
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
          if (animationType == StripTransitionType.LEFT_TO_RIGHT)
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
          if (animationType == StripTransitionType.RIGHT_TO_LEFT)
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
