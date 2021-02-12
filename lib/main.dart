import 'package:asuka/asuka.dart' as asuka;
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nintendo_swt/core/components/banner/custom_banner.dart';
import 'package:nintendo_swt/core/gaming/board_game.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await SystemChrome.setEnabledSystemUIOverlays([]);

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: AppColors.bgScreenBottom,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ),
  // );

  await Flame.images.loadAll(
    [
      'player_ship_red.png',
      'joystick_background.png',
      'joystick_knob.png',
    ],
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final BoardGame boardGame = BoardGame();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'NintendoSwt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, screen) => asuka.builder(
          context,
          CustomBanner(
            screen: screen,
          ),
        ),
        // home: NintendoScreen(),
        home: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: boardGame.onPanStart,
            onPanUpdate: boardGame.onPanUpdate,
            onPanEnd: boardGame.onPanEnd,
            child: boardGame.widget,
          ),
        ),
      );
}
