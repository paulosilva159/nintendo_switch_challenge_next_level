import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:meta/meta.dart';

import 'board_game.dart';

class PlayerShip {
  PlayerShip({
    @required this.boardGame,
  }) : assert(boardGame != null) {
    initState();

    _height = boardGame.tileSize * aspectRatio;

    _rect = Rect.fromLTWH(
      boardGame.screenSize.width / 2 - _height / 2,
      boardGame.screenSize.height / 2 - _height / 2,
      _height,
      _height,
    );

    _sprite = Sprite('player_ship_red.png');
  }

  final BoardGame boardGame;

  double aspectRatio;
  double lastMoveRadAngle;
  bool isMoving;
  Sprite _sprite;
  double _height;
  Rect _rect;

  void initState() {
    aspectRatio = 1.4;

    lastMoveRadAngle = 0.0;

    isMoving = false;
  }

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, _rect);
  }

  void update(double t) {}
}
