import 'package:flutter/material.dart';

class MinusDividerWidget extends StatelessWidget {
  const MinusDividerWidget(
      {Key? key,
      required this.left,
      required this.right,
      this.thickness = 1,
      this.opacity = 0.1})
      : super(key: key);

  final double right, left, thickness, opacity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: thickness,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  left: left * -1,
                  right: right * -1,
                  child: Divider(
                    height: 0,
                    thickness: thickness,
                    color: Theme.of(context).colorScheme.surface,
                  ))
            ]));
  }
}
