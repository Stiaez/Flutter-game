// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';

// Project imports:
import 'package:game/class/bird.dart';

void main() {
  runApp(
    GameWidget(
      game: FlameGame(world: MyWorld()),
      backgroundBuilder:
          (context) => Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/background_1.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
    ),
  );
}

class MyWorld extends World with HasGameReference<FlameGame> {
  @override
  Future<void> onLoad() async {
    add(Bird(position: Vector2(0, 0)));
  }
}
