import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class BigRoundedButton extends StatelessWidget {
  const BigRoundedButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    final _layer0Size = Size.fromRadius(height);
    final _layer1Size = Size.fromRadius(height * 4 / 5);
    final _layer2Size = Size.fromRadius(height * 3.5 / 5);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: _layer0Size.height,
          width: _layer0Size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.bigButtonLayerBorder,
            ),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.bigButtonLayer0Top,
                AppColors.bigButtonLayer0Bottom,
              ],
            ),
          ),
        ),
        Container(
          height: _layer1Size.height,
          width: _layer1Size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.bigButtonLayerBorder,
            ),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.bigButtonLayer1Top,
                AppColors.bigButtonLayer1Bottom,
              ],
            ),
          ),
        ),
        Container(
          height: _layer2Size.height,
          width: _layer2Size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.bigButtonLayerBorder,
            ),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                AppColors.bigButtonLayer2Top,
                AppColors.bigButtonLayer2Bottom,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
