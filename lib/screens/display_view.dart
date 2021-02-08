import 'package:flutter/material.dart';

import '../core/colors/colors.dart';
import 'logo_view.dart';

class DisplayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.screen,
        ),
        child: LogoView(
          color: AppColors.bigLogo,
          height: MediaQuery.of(context).size.height * 1.5 / 16,
        ),
      ),
    );
  }
}
