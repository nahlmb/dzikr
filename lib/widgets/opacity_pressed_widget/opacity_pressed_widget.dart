import 'package:flutter/material.dart';

class OpacityPressedWidget extends StatefulWidget {
  const OpacityPressedWidget(
      {Key? key, required this.child, required this.onPress})
      : super(key: key);

  final Function() onPress;
  final Widget child;

  @override
  State<OpacityPressedWidget> createState() => _OpacityPressedWidgetState();
}

class _OpacityPressedWidgetState extends State<OpacityPressedWidget> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        opacity = 1;
        setState(() {});
        widget.onPress();
      },
      onTapDown: (TapDownDetails details) {
        opacity = 0.4;
        setState(() {});
      },
      onTapCancel: () {
        opacity = 1.0;
        setState(() {});
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}
