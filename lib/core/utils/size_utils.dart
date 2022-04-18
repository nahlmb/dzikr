import 'package:flutter/material.dart';

class DzikrSizeUtils {
  static double adjustQuranTextSizeWithMediaQuery(
      double fontSize, BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? (MediaQuery.of(context).size.width * fontSize)
        : (MediaQuery.of(context).size.width * (fontSize - 0.003));
  }
}
