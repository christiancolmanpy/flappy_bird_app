import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_app/components/background.dart';
import 'package:flappy_bird_app/components/bird.dart';
import 'package:flappy_bird_app/components/ground.dart';
import 'package:flappy_bird_app/components/pipe_group.dart';
import 'package:flappy_bird_app/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
