import 'package:flutter/material.dart';

class ThemeUtils {}

ColorScheme colorSchame(BuildContext context) {
  return Theme.of(context).colorScheme;
}

TextTheme textTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}
