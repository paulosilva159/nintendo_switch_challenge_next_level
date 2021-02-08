import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

import 'display_view.dart';
import 'joy_pads_view.dart';

class NintendoScreen extends StatefulWidget {
  @override
  _NintendoScreenState createState() => _NintendoScreenState();
}

class _NintendoScreenState extends State<NintendoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.bgScreenTop,
                AppColors.bgScreenBottom,
              ],
            ),
          ),
          child: orientation == Orientation.portrait
              ? NintendoScreenVerticalView()
              : NintendoScreenHorizontalView(),
        );
      }),
    );
  }
}

class NintendoScreenHorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LeftJoyPadView(
            orientation: ViewOrientation.horizontal,
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: DisplayView(),
          ),
        ),
        Expanded(
          child: RightJoyPadView(
            orientation: ViewOrientation.horizontal,
          ),
        ),
      ],
    );
  }
}

class NintendoScreenVerticalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: DisplayView(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeftJoyPadView(
                orientation: ViewOrientation.vertical,
              ),
              Expanded(
                child: InBetweenPadsView(),
              ),
              RightJoyPadView(
                orientation: ViewOrientation.vertical,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum ViewOrientation {
  vertical,
  horizontal,
}
