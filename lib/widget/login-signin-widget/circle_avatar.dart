import 'package:flutter/material.dart';

class CircleAvataar extends StatelessWidget {
  final Color color;
  final Image image;
  final double radius;
  final double height;
  final double width;
  const CircleAvataar({
    Key? key,
    required this.color,
    required this.image,
    required this.radius,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: Container(height: height, width: width, child: image));
  }
}
