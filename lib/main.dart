// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';

// Project imports:
import 'package:game/class/bird.dart';

void main() {
  runApp(GameWidget(game: FlameGame(world: MyWorld())));
}

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    add(Bird(position: Vector2(0, 0)));
  }
}
