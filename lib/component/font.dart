import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle headline1(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sen',
    );
  }

  static TextStyle bodyText(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      fontFamily: 'Sen',
    );
  }
}
