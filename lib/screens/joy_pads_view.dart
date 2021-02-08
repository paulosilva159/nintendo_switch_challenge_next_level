import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/components/buttons/big_rounded_button.dart';
import 'package:nintendo_swt/core/components/buttons/buttons_quadra.dart';
import 'package:nintendo_swt/core/components/buttons/home_button.dart';
import 'package:nintendo_swt/core/components/buttons/minus_button.dart';
import 'package:nintendo_swt/core/components/buttons/plus_button.dart';
import 'package:nintendo_swt/core/components/buttons/sound_button.dart';

import '../core/colors/colors.dart';
import 'logo_view.dart';
import 'nintendo_screen.dart';

class LeftJoyPadView extends StatelessWidget {
  const LeftJoyPadView({
    @required this.orientation,
  }) : assert(orientation != null);

  final ViewOrientation orientation;

  @override
  Widget build(BuildContext context) {
    final isVerticalView = orientation == ViewOrientation.vertical;

    final _width = MediaQuery.of(context).size.width / (isVerticalView ? 3 : 5);

    return Container(
      width: _width,
      decoration: BoxDecoration(
        color: AppColors.leftSide,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(112),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: MinusButton(),
          ),
          BigRoundedButton(
            height: _width / 4,
          ),
          ButtonsQuadra(
            type: ButtonsQuadraType.directional,
            size: Size(_width * 2 / 3, _width * 2 / 3),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SoundButton(
              height: _width / 4,
            ),
          )
        ],
      ),
    );
  }
}

class RightJoyPadView extends StatelessWidget {
  const RightJoyPadView({
    @required this.orientation,
  }) : assert(orientation != null);

  final ViewOrientation orientation;

  @override
  Widget build(BuildContext context) {
    final isVerticalView = orientation == ViewOrientation.vertical;

    final _width = MediaQuery.of(context).size.width / (isVerticalView ? 3 : 5);

    return Container(
      width: _width,
      decoration: BoxDecoration(
        color: AppColors.rightSide,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(112),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: PlusButton(),
          ),
          ButtonsQuadra(
            type: ButtonsQuadraType.action,
            size: Size(_width * 2 / 3, _width * 2 / 3),
          ),
          BigRoundedButton(
            height: _width / 4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: HomeButton(
              height: _width / 4,
            ),
          ),
        ],
      ),
    );
  }
}

class InBetweenPadsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LampQuadraView(
          isFirstLampOn: true,
        ),
        LogoView(
          color: AppColors.smallLogo,
          height: MediaQuery.of(context).size.height * 2.5 / 64,
        ),
        LampQuadraView(
          isFirstLampOn: false,
        ),
      ],
    );
  }
}

class LampQuadraView extends StatelessWidget {
  const LampQuadraView({@required this.isFirstLampOn})
      : assert(isFirstLampOn != null);

  final bool isFirstLampOn;

  @override
  Widget build(BuildContext context) {
    final _size = Size.fromRadius(4);

    return Container(
      height: 44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: _size.height,
            width: _size.width,
            decoration: BoxDecoration(
              color: isFirstLampOn ? AppColors.lampOn : AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: _size.height,
            width: _size.width,
            decoration: BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: _size.height,
            width: _size.width,
            decoration: BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: _size.height,
            width: _size.width,
            decoration: BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
