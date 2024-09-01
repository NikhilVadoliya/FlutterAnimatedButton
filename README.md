# flutter_animated_button :dizzy: :champagne:	 

<div align="left">  
   <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/plateform-flutter-orange"  
      alt="Platform" />  
  </a>  
   <a href="https://pub.dev/packages/flutter_animated_button">  
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
    <img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FNikhilVadoliya%2FFlutterAnimatedButton&count_bg=%2379C83D&title_bg=%23555555&icon=github.svg&icon_color=%23E7E7E7&title=visit&edge_flat=false"/>  
  </a>  
</div><br>  

<img src="https://raw.githubusercontent.com/NikhilVadoliya/FlutterAnimatedButton/dev/assets/banner_1.0.0_2.gif"/>


## Installing

###  Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_animated_button: <latest_version>
```

### Import it

Now in your `Dart` code, you can use:

```dart
import 'package:flutter_animated_button/flutter_animated_button.dart';

```

</br>
</br>


# Contribute to Development
Your contribution will help improve the plugin

<a href="https://www.buymeacoffee.com/nick94" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>



# Usage

You can override the `animationDuration` of animation of the button by setting its duration in each AnimatedButton class, also you can get `animationController` for animation status and animation value during the animation. You can change text style, selected  textColor and background color of button by `textStyle`,`selectedTextColor`,`backgroundColor` and `selectedBackgroundColor`. If you want revert animation when button already select then you can do it by `isReverse` property.

```dart
 AnimatedButton(
                width: 200,
                text: 'SUBMIT',
                selectedTextColor: Colors.black,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: TextStyle(
                    fontSize: 28,
                    letterSpacing: 5,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w300),
              )
```

</br>
</br>

### Animation On
  - AnimatedOn.onTap
  - AnimatedOn.onHover


</br>
</br>

# Used in App
<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/demo_1.gif?raw=true" height = "500px" width= "250px"> <img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/demo_2.gif?raw=true" height = "500px" width= "250px">  <img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/demo_3.gif?raw=true" height = "500px" width= "250px">

</br>
</br>

# Some **new** animation in latest version :zap:
  * **Animations** : LEFT_TOP_ROUNDER, LEFT_BOTTOM_ROUNDER, BOTTOM_CENTER_ROUNDER, CENTER_ROUNDER...etc
  * Selected button text support 
  
  </br>
  
<img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/new_1.gif?raw=true" height = "190px" width= "310px">. <img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/new_2.gif?raw=true" height = "190px" width= "310px"> . <img src="https://github.com/NikhilVadoliya/FlutterAnimatedButton/blob/main/assets/new_3.gif?raw=true" height = "190px" width= "310px">



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
             backgroundColor: Colors.black,
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
              backgroundColor: Colors.black,
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
              stripTransitionType: StripTransitionType.LEFT_TO_RIGHT,
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

#### AnimatedButton
|               |               |                      |                       |                |
|---------------|---------------|----------------------|-----------------------|----------------|
| LEFT_TO_RIGHT | CENTER_LR_IN  | LEFT_TOP_ROUNDER     | RIGHT_TOP_ROUNDER     | CENTER_ROUNDER |
| RIGHT_TO_LEFT | CENTER_TB_IN  | LEFT_CENTER_ROUNDER  | RIGHT_CENTER_ROUNDER  | -              |
| TOP_TO_BOTTOM | CENTER_LR_OUT | LEFT_BOTTOM_ROUNDER  | TOP_CENTER_ROUNDER    | -              |
| BOTTOM_TO_TOP | CENTER_TB_OUT | RIGHT_BOTTOM_ROUNDER | BOTTOM_CENTER_ROUNDER | -              |
 
#### AnimatedButton.strip
|               |              
|---------------|
| LEFT_TO_RIGHT |
| RIGHT_TO_LEFT | 
| TOP_TO_BOTTOM | 
| BOTTOM_TO_TOP |

 
 </br>
</br>


# Bugs or Requests :bug:	

If you encounter any problems feel free to open an [issue](https://github.com/NikhilVadoliya/FlutterAnimatedButton/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/NikhilVadoliya/FlutterAnimatedButton/issues/new?template=feature_request.md) on GitHub and I'll look into it. Pull request are also welcome.

</br>

License :closed_lock_with_key:	
----

MIT License
