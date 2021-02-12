import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nintendo_swt/core/gaming/board_game.dart';

class JoyPad {
  JoyPad({
    @required this.boardGame,
    this.knobAspectRatio = 1.2,
  }) : assert(boardGame != null) {
    _backgroundSprite = Sprite('joystick_background.png');
    _knobSprite = Sprite('joystick_knob.png');

    initState();
  }

  final BoardGame boardGame;
  final double knobAspectRatio;

  double backgroundAspectRatio;
  bool isDragging;
  Rect _backgroundRect;
  Rect _knobRect;
  Sprite _backgroundSprite;
  Sprite _knobSprite;
  Offset dragPosition;

  Future<void> initState() async {
    backgroundAspectRatio = 2.5;
    isDragging = false;

    final backgroundRadius = boardGame.tileSize * backgroundAspectRatio / 2;

    final backgroundCenterPosition = Offset(
      backgroundRadius * 3 / 2,
      boardGame.screenSize.height - backgroundRadius * 3 / 2,
    );

    _backgroundRect = Rect.fromCircle(
      center: backgroundCenterPosition,
      radius: backgroundRadius,
    );

    final knobRadius = boardGame.tileSize * knobAspectRatio / 2;

    final knobCenterPosition = Offset(
      _backgroundRect.center.dx,
      _backgroundRect.center.dy,
    );

    _knobRect = Rect.fromCircle(
      center: knobCenterPosition,
      radius: knobRadius,
    );

    dragPosition = _knobRect.center;
  }

  void onPanStart(DragStartDetails details) {
    if (_knobRect.contains(details.globalPosition)) {
      isDragging = true;

      boardGame.playerShip.isMoving = true;
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (isDragging) {
      dragPosition = details.globalPosition;
    }
  }

  void onPanEnd(DragEndDetails details) {
    isDragging = false;

    dragPosition = _backgroundRect.center;

    boardGame.playerShip.isMoving = false;
  }

  void render(Canvas canvas) {
    _backgroundSprite.renderRect(canvas, _backgroundRect);

    _knobSprite.renderRect(canvas, _knobRect);
  }

  void update(double t) {
    if (isDragging) {
      final _radAngle = atan2(
        dragPosition.dy - _backgroundRect.center.dy,
        dragPosition.dx - _backgroundRect.center.dx,
      );

      boardGame.playerShip.lastMoveRadAngle = _radAngle;

      final point = Point(
        _backgroundRect.center.dx,
        _backgroundRect.center.dy,
      );

      var dist = point.distanceTo(
        Point(
          dragPosition.dx,
          dragPosition.dy,
        ),
      );

      dist = dist < (boardGame.tileSize * backgroundAspectRatio / 2)
          ? dist
          : (boardGame.tileSize * backgroundAspectRatio / 2);

      final nextX = dist * cos(_radAngle);
      final nextY = dist * sin(_radAngle);
      final nextPointOffset = Offset(nextX, nextY);

      final offsetDifference = Offset(
            _backgroundRect.center.dx + nextPointOffset.dx,
            _backgroundRect.center.dy + nextPointOffset.dy,
          ) -
          _knobRect.center;

      _knobRect = _knobRect.shift(offsetDifference);
    } else {
      final offsetDifference = dragPosition - _knobRect.center;

      _knobRect = _knobRect.shift(offsetDifference);
    }
  }
}
