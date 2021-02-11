import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class LampGroup extends StatelessWidget {
  const LampGroup({@required this.isFirstLampOn})
      : assert(isFirstLampOn != null);

  final bool isFirstLampOn;

  @override
  Widget build(BuildContext context) {
    const _size = Size.fromRadius(4);

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
            decoration: const BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: _size.height,
            width: _size.width,
            decoration: const BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: _size.height,
            width: _size.width,
            decoration: const BoxDecoration(
              color: AppColors.lampOff,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
