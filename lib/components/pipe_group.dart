import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_app/components/pipe.dart';
import 'package:flappy_bird_app/game/configuration.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flappy_bird_app/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  final _random = Random();
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    addAll([
      Pipe(height: 100, pipePosition: PipePosition.top),
      Pipe(height: 200, pipePosition: PipePosition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}
