import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key key, this.screen}) : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) => Banner(
        message: 'Flutter',
        color: AppColors.lampOn,
        location: BannerLocation.topEnd,
        textStyle: const TextStyle(
          color: AppColors.textBanner,
        ),
        child: screen,
      );
}
