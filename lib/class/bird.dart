// Package imports:
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Bird extends SpriteComponent with TapCallbacks, HasGameReference {
  double velocityY = 0.0;
  final double gravity = 800;
  final double jumpSpeed = -300;
  bool isStarted = false;

  Bird({super.position}) : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('characters/bird_frame_1.png');
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isStarted) {
      velocityY += gravity * dt;
      position.y += velocityY * dt;

      if (position.y > game.size.y) {
        position.y = game.size.y;
        velocityY = 0;
      }
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    isStarted = true;
    velocityY = jumpSpeed;
  }
}
