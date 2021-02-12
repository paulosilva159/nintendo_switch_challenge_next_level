import 'package:flutter/material.dart';

class PlusButtonClipper extends CustomClipper<Path> {
  final edgeSize = 8.0;

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, edgeSize)
    ..lineTo(0, edgeSize * 2)
    ..lineTo(edgeSize, edgeSize * 2)
    ..lineTo(edgeSize, edgeSize * 3)
    ..lineTo(edgeSize * 2, edgeSize * 3)
    ..lineTo(edgeSize * 2, edgeSize * 2)
    ..lineTo(edgeSize * 3, edgeSize * 2)
    ..lineTo(edgeSize * 3, edgeSize)
    ..lineTo(edgeSize * 2, edgeSize)
    ..lineTo(edgeSize * 2, 0)
    ..lineTo(edgeSize, 0)
    ..lineTo(edgeSize, edgeSize)
    ..lineTo(0, edgeSize);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
