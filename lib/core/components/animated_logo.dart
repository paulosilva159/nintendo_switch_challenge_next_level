import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/components/logo_icon.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    @required this.color,
    @required this.width,
  })  : assert(width != null),
        assert(color != null);

  final double width;
  final Color color;

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    final _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation =
        Tween<double>(begin: widget.width * 0.9, end: widget.width * 1.2)
            .animate(_curvedAnimation);

    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, _) =>
            LogoIcon(width: _animation.value, color: widget.color),
      );
}
