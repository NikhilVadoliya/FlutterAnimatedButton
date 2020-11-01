# Flutter Animated Button :dizzy: :champagne:	 

<div align="left">  
   <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/plateform-flutter-orange"  
      alt="Platform" />  
  </a>  
   <a href="https://pub.dartlang.org/packages/animated_text_kit">  
    <img src="https://img.shields.io/pub/v/flutter_animated_button"  
      alt="Pub Package" />  
     
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>  
   <a href="#">  
    <img src="https://img.shields.io/github/languages/code-size/NikhilVadoliya/FlutterAnimatedButton"/>  
  </a>  
  
   </a>  
   <a href="#">  
    <img src="https://hits.dwyl.com/NikhilVadoliya/FlutterAnimatedButton.svg"/>  
  </a>  
</div><br>  

<img src="https://raw.githubusercontent.com/NikhilVadoliya/FlutterAnimatedButton/main/assets/banner.gif"/>


## Installing

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_animated_button: <latest_version>
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```css
$ pub get
```

with `Flutter`:

```css
$ flutter packages get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:flutter_animated_button/flutter_animated_button.dart';

```
</br>
</br>

# Usage

You can override the `animationDuration` of animation of the button by setting its duration in each AnimatedButton class, also you can get `animationController` for animation status and animation value during the animation. You can change text style, selected  textColor and background color of button by `textStyle`,`selectedTextColor`,`unSelectedBackgroundColor` and `selectedBackgroundColor`. If you want revert animation when button already select then you can do it by `isReverse` property.

```dart
 AnimatedButton(
                width: 200,
                text: 'SUBMIT',
                selectedTextColor: Colors.black,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: TextStyle(
                    fontSize: 28,
                    letterSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              )
```

</br>
</br>


# Available **Animations** 	:dizzy:	

## AnimatedButton

<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/normal_1_min.gif?raw=true" align = "left" height = "265px" width= "430px">

```dart
  AnimatedButton(
              height: 70,
              width: 200,
              text: 'SUBMIT',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.BOTTOM_TO_TOP,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
```
<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/dev/assets/border-1-min.gif?raw=true" align = "left" height = "265px" width= "430px">

```dart
  AnimatedButton(
             height: 70,
             width: 200,
             text: 'SUBMIT',
             isReverse: true,
             selectedTextColor: Colors.black,
             transitionType: TransitionType.LEFT_TO_RIGHT,
             textStyle: submitTextStyle,
             unSelectedBackgroundColor: Colors.black,
             borderColor: Colors.white,
             borderRadius: 0,
             borderWidth: 2,
           ),
```
<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/dev/assets/rounder_2_min.gif?raw=true" align = "left" height = "265px" width= "430px">

```dart
    AnimatedButton(
              height: 70,
              width: 200,
              text: 'SUBMIT',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: submitTextStyle,
              unSelectedBackgroundColor: Colors.black,
              borderColor: Colors.white,
              borderRadius: 50,
              borderWidth: 2,
            ),
```

</br>
## AnimatedButton.strip

<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/strip_1_min.gif?raw=true" align = "left" height = "275px" width= "430px">

```dart
  AnimatedButton.strip(
              width: 200,
              height: 70,
              text: 'SUBMIT',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              selectedBackgroundColor: Colors.white,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
```

</br>
</br>

# Available **Animations** Types :sparkles:	
</br>
</br>

#### AnimatedButton
 - LEFT_TO_RIGHT
 - RIGHT_TO_LEFT
 - TOP_TO_BOTTOM
 - BOTTOM_TO_TOP
 
#### AnimatedButton.strip
 - LEFT_TO_RIGHT
 - RIGHT_TO_LEFT
 - TOP_TO_BOTTOM
 - BOTTOM_TO_TOP
 
 </br>
</br>


# Bugs or Requests :bug:	

If you encounter any problems feel free to open an [issue](https://github.com/NikhilVadoliya/FlutterAnimatedButton/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/NikhilVadoliya/FlutterAnimatedButton/issues/new?template=feature_request.md) on GitHub and I'll look into it. Pull request are also welcome.

License :closed_lock_with_key:	
----

MIT License
