import 'package:flutter/material.dart';

class LayerItem extends StatelessWidget {
  const LayerItem({
    Key? key,
    required this.callback,
    required this.top,
    required this.left,
    required this.height,
    required this.width,
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
  }) : super(key: key);

  final VoidCallback callback;
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}