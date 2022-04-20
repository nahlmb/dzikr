import 'package:flutter/material.dart';

class QuranPageReaderConfig {
  QuranPageReaderConfig(
      {this.isUsingBottomIndicator = false,
      this.pageMode = QuranPageMode.page,
      this.primaryColor = const Color(0xffF2F2F2),
      this.onPrimaryColor = Colors.black,
      this.accentColor = const Color(0xff0FA971),
      this.onAccentColor = Colors.white,
      this.surfaceColor = const Color(0xffDFDFDF),
      this.onSurfaceColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.onBackgroundColor = Colors.black});
  final bool isUsingBottomIndicator;
  final String pageMode;
  final Color primaryColor,
      onPrimaryColor,
      accentColor,
      surfaceColor,
      onSurfaceColor,
      onAccentColor,
      backgroundColor,
      onBackgroundColor;
}

class QuranPageMode {
  static const page = "page";
  static const list = "list";
}
