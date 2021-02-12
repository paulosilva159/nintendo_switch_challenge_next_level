import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'joy_pad.dart';
import 'player_ship.dart';

class BoardGame extends Game {
  BoardGame() {
    initState();
  }

  PlayerShip playerShip;
  JoyPad joyPad;

  Size screenSize;
  double tileSize;

  Future<void> initState() async {
    resize(
      await Flame.util.initialDimensions(),
    );

    joyPad = JoyPad(boardGame: this);

    playerShip = PlayerShip(boardGame: this);
  }

  @override
  void resize(Size size) {
    screenSize = size;

    tileSize = screenSize.height / 9;
  }

  void onPanStart(DragStartDetails details) {
    joyPad.onPanStart(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    joyPad.onPanUpdate(details);
  }

  void onPanEnd(DragEndDetails details) {
    joyPad.onPanEnd(details);
  }

  @override
  void render(Canvas canvas) {
    joyPad.render(canvas);

    playerShip.render(canvas);
  }

  @override
  void update(double t) {
    joyPad.update(t);

    playerShip.update(t);
  }
}
