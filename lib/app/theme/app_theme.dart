import 'package:flutter/material.dart';

final appTheme = ThemeData(
  accentColor: Color(0xff16a085),
    primaryColor: Colors.grey,
    splashColor: Color(0xff16a085),
    primaryColorBrightness: Brightness.light,
    buttonTheme: ButtonThemeData(buttonColor: Color(0xff16a085)),

    sliderTheme: SliderThemeData(
    activeTrackColor: Colors.green,
    inactiveTrackColor: Color(0xff16a085),
    trackShape: RoundedRectSliderTrackShape(),
    trackHeight: 4.0,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
    thumbColor: Colors.green,
    overlayColor: Colors.lightGreen.withAlpha(32),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
    tickMarkShape: RoundSliderTickMarkShape(),
    activeTickMarkColor: Colors.lightGreen,
    inactiveTickMarkColor: Color(0xff16a085),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    valueIndicatorColor: Colors.lightGreen,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.white,
    ),
    ));
