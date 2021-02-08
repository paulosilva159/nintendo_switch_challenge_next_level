import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/components/clippers/logo_clipper.dart';

class LogoView extends StatelessWidget {
  const LogoView({
    @required this.color,
    @required this.height,
  })  : assert(height != null),
        assert(color != null);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: height,
          height: height * 2,
          child: ClipPath(
            clipper: LogoLeftPadClipper(
              customSize: Size(height, height * 2),
            ),
            child: Container(
              color: color,
            ),
          ),
        ),
        SizedBox(
          width: height / 4,
        ),
        Container(
          width: height,
          height: height * 2,
          child: ClipPath(
            clipper: LogoRightPadClipper(
              customSize: Size(height, height * 2),
            ),
            child: Container(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
