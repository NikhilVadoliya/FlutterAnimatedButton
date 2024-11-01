import 'package:flutter/material.dart';
import 'package:flutter_animated_button/src/rect_clipper.dart';
import 'package:flutter_animated_button/src/transition_type.dart';

import 'strip_animated.dart';

class AnimatedButton extends StatefulWidget {
  /// [String] text of button
  ///
  final String text;

  /// [TextStyle] textStyle of button's text
  final TextStyle textStyle;

  /// [Color] text colour which displaying  when the user press on the button / select it
  final Color selectedTextColor;

  /// [Color] button background colour which displaying
  /// when the user press on button / select it
  final Color selectedBackgroundColor;

  ///[String] text of button which display when button is selected
  final String selectedText;

  ///[Color] button background colour which displaying when
  ///the user deselect button
  final Color backgroundColor;

  /// [bool] [true] - you can select and deselect button after select/deselect it
  /// [false] - you can't deselect it after select it.
  /// by Default is [false]
  final bool isReverse;

  /// You can enter Duration for the animation to be retriggered after a certain time
  /// after the button is pressed
  ///
  final Duration? reverseAnimation;
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
  final VoidCallback? onPress;

  /// called this function when user press on button and pass value of button
  /// [true] - button selected
  /// [false] - button deSelected
  final ValueChanged<bool>? onChanges;

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

  ///[Color] color of the border by Default it is [Colors.transparent]
  final Color borderColor;

  /// [double] width of the border by Default it is 0
  final double borderWidth;

  ///[double] radius of the border bt Default it is 0
  final double borderRadius;

  ///[gradient], which also fills the button
  /// * If [gradient] is null, this decoration does not paint gradients.
  final Gradient? gradient;

  ///[selectedGradientColor], which also fills the  selected button
  /// * If [selectedGradientColor] is null, this decoration does not paint gradients.
  final Gradient? selectedGradientColor;

  ///[isSelected] if this is true then button is selected
  /// it's false then button is deselected;
  /// default it is false
  final bool isSelected;

  ///[animatedOn] when animated
  /// By Default value [AnimatedOn.onTap]
  final AnimatedOn animatedOn;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.transitionType = TransitionType.LEFT_TO_RIGHT,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
    this.selectedTextColor = Colors.blue,
    this.selectedBackgroundColor = Colors.white,
    this.backgroundColor = Colors.white60,
    this.isReverse = false,
    this.reverseAnimation,
    this.textMaxLine = 1,
    this.textOverflow = TextOverflow.clip,
    this.textAlignment = Alignment.center,
    this.height = 50,
    this.width = double.infinity,
    this.animationDuration = const Duration(milliseconds: 500),
    this.onChanges,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.gradient,
    this.selectedGradientColor,
    this.isSelected = false,
    this.selectedText = '',
    this.animatedOn = AnimatedOn.onTap,
  })  : isStrip = false,
        stripColor = Colors.transparent,
        stripSize = 0,
        stripTransitionType = StripTransitionType.LEFT_TO_RIGHT,
        super(key: key);

  AnimatedButton.strip({
    Key? key,
    required this.text,
    required this.onPress,
    this.isReverse = false,
    this.reverseAnimation,
    this.height = 50,
    this.width = double.infinity,
    this.stripTransitionType = StripTransitionType.LEFT_TO_RIGHT,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
    this.selectedTextColor = Colors.blue,
    this.selectedBackgroundColor = Colors.white,
    this.textMaxLine = 1,
    this.textOverflow = TextOverflow.clip,
    this.textAlignment = Alignment.center,
    this.animationDuration = const Duration(milliseconds: 500),
    this.backgroundColor = Colors.white60,
    this.stripColor = Colors.white,
    this.stripSize = 6,
    this.onChanges,
    this.gradient,
    this.selectedGradientColor,
    this.isSelected = false,
    this.selectedText = '',
    this.animatedOn = AnimatedOn.onTap,
  })  : borderRadius = 0,
        borderWidth = 0,
        borderColor = Colors.transparent,
        transitionType = TransitionType.LEFT_TO_RIGHT,
        isStrip = true;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> slideAnimation;
  Animation? scaleAnimation;
  double? slideBegin;
  double? slideEnd;

  /// [return] animationController of check status and animation
  AnimationController? get animationController => _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.animationDuration, vsync: this);
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

    slideAnimation = Tween(begin: slideBegin, end: slideEnd)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));

    widget.isSelected ? _controller.forward() : _controller.reverse();
  }

  @override
  void didUpdateWidget(covariant AnimatedButton oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      widget.isSelected ? _controller.forward() : _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // deselect/normal text
    var textNormal = Text(
      widget.text,
      maxLines: widget.textMaxLine,
      overflow: widget.textOverflow,
      style: widget.textStyle,
    );
    // selected text
    var textSelected = Text(
      widget.selectedText.isNotEmpty ? widget.selectedText : widget.text,
      maxLines: widget.textMaxLine,
      overflow: widget.textOverflow,
      style: widget.textStyle.copyWith(color: widget.selectedTextColor),
    );

    var body = Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: widget.gradient,
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
                  textAlignment: widget.textAlignment,
                )
              : Align(
                  child: textNormal,
                  alignment: widget.textAlignment,
                ),
        ),
        AnimatedBuilder(
          animation: _controller,
          child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                gradient: widget.selectedGradientColor,
                color: widget.selectedBackgroundColor,
                border: Border.all(color: widget.borderColor, width: widget.borderWidth),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.isStrip
                  ? StripAnimated(
                      animationType: widget.stripTransitionType,
                      stripColor: widget.stripColor,
                      stripSize: widget.stripSize,
                      text: textSelected,
                      textAlignment: widget.textAlignment,
                    )
                  : Align(
                      child: textSelected,
                      alignment: widget.textAlignment,
                    )),
          builder: (context, child) {
            return ClipPath(
              clipper: widget.isStrip
                  ? RectStripClipper(slideAnimation.value, widget.stripTransitionType)
                  : RectClipper(slideAnimation.value, widget.transitionType),
              child: child,
            );
          },
        ),
      ],
    );
    return widget.animatedOn == AnimatedOn.onHover
        ? MouseRegion(
            onEnter: (_) => onHover(true),
            onExit: (_) => onHover(false),
            child: InkWell(onTap: () => widget.onPress?.call(), child: body))
        : InkWell(
            onTap: () => onPressed(),
            child: body,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  onPressed() async {
    if (widget.animatedOn == AnimatedOn.onTap) {
      if (widget.isReverse && _controller.isCompleted) {
        _controller.reverse();
        widget.onChanges?.call(false);
      } else {
        _controller.forward();
        widget.onChanges?.call(true);
      }
    }
    widget.onPress?.call();
    if (widget.reverseAnimation != null) {
      await Future.delayed(widget.reverseAnimation!);
      if (widget.isReverse && _controller.isCompleted) {
        _controller.reverse();
        widget.onChanges?.call(false);
      } else {
        _controller.forward();
        widget.onChanges?.call(true);
      }
    }
  }

  onHover(bool enter) {
    enter ? _controller.forward() : _controller.reverse();
    widget.onChanges?.call(enter);
  }
}
