import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

import 'small_roudend_button.dart';

class ButtonsQuadra extends StatelessWidget {
  const ButtonsQuadra({
    @required this.type,
    @required this.size,
  })  : assert(type != null),
        assert(size != null);

  final ButtonsQuadraType type;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SmallRoundedButton(
              height: size.height / 5.5,
              type: type,
              icon: type == ButtonsQuadraType.directional
                  ? Icon(
                      Icons.arrow_drop_up,
                      color: AppColors.digitalDirectionTopLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: AppColors.actionButtonTopLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SmallRoundedButton(
              height: size.height / 5.5,
              type: type,
              icon: type == ButtonsQuadraType.directional
                  ? Icon(
                      Icons.arrow_left,
                      color: AppColors.digitalDirectionLeftLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'Y',
                        style: TextStyle(
                          color: AppColors.actionButtonLeftLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SmallRoundedButton(
              height: size.height / 5.5,
              type: type,
              icon: type == ButtonsQuadraType.directional
                  ? Icon(
                      Icons.arrow_right,
                      color: AppColors.digitalDirectionRightLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: AppColors.actionButtonRightLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmallRoundedButton(
              height: size.height / 5.5,
              type: type,
              icon: type == ButtonsQuadraType.directional
                  ? Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.digitalDirectionBottomLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'B',
                        style: TextStyle(
                          color: AppColors.actionButtonBottomLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ButtonsQuadraType {
  directional,
  action,
}
