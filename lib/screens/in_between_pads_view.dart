import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/lamp_group.dart';
import 'package:nintendo_swt/core/components/logo_icon.dart';

class InBetweenPadsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LampGroup(
          isFirstLampOn: true,
        ),
        LogoIcon(
          color: AppColors.smallLogo,
          width: MediaQuery.of(context).size.height * 2.5 / 64,
        ),
        const LampGroup(
          isFirstLampOn: false,
        ),
      ],
    );
}
