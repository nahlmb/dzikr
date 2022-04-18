import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OpacityLongpressWidget extends StatefulWidget {
  const OpacityLongpressWidget(
      {Key? key, required this.child, required this.onPress})
      : super(key: key);

  final Function() onPress;
  final Widget child;

  @override
  State<OpacityLongpressWidget> createState() => _OpacityLongpressWidgetState();
}

class _OpacityLongpressWidgetState extends State<OpacityLongpressWidget> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        opacity = 1;
        setState(() {});
        widget.onPress();
      },
      onLongPressDown: (LongPressDownDetails details) {
        opacity = 0.4;
        setState(() {});
      },
      onLongPressCancel: () {
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
