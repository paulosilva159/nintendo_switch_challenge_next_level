import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

import 'buttons_quadra.dart';

class SmallRoundedButton extends StatelessWidget {
  SmallRoundedButton({
    @required this.icon,
    @required this.type,
    @required this.height,
  })  : assert(icon != null),
        assert(type != null),
        assert(height != null);

  final Widget icon;
  final ButtonsQuadraType type;
  final double height;

  @override
  Widget build(BuildContext context) {
    final _layer0Size = Size.fromRadius(height);
    final _layer1Size = Size.fromRadius(height * 4 / 5);

    final isDirectionalButtons = type == ButtonsQuadraType.directional;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: _layer0Size.height,
          width: _layer0Size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                isDirectionalButtons
                    ? AppColors.digitalDirectionBottomLayer0Top
                    : AppColors.actionButtonBottomLayer0Top,
                isDirectionalButtons
                    ? AppColors.digitalDirectionBottomLayer0Bottom
                    : AppColors.actionButtonBottomLayer0Bottom,
              ],
            ),
          ),
        ),
        Container(
          height: _layer1Size.height,
          width: _layer1Size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                isDirectionalButtons
                    ? AppColors.digitalDirectionBottomLayer1Top
                    : AppColors.actionButtonBottomLayer1Top,
                isDirectionalButtons
                    ? AppColors.digitalDirectionBottomLayer1Bottom
                    : AppColors.actionButtonBottomLayer1Bottom,
              ],
            ),
          ),
          child: icon,
        ),
      ],
    );
  }
}
