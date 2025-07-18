// Package imports:
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';

class Bird extends SpriteComponent with TapCallbacks, HasGameReference {
  double velocityY = 0.0;
  final double gravity = 800;
  final double jumpSpeed = -300;
  bool isStarted = false;

  Sprite? wingUpSprite;
  SpriteAnimationTicker? wingFlapTicker;

  Bird({super.position}) : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    wingUpSprite = await Sprite.load('characters/bird_frame_1.png');
    final frame2 = await Sprite.load('characters/bird_frame_2.png');
    final frame3 = await Sprite.load('characters/bird_frame_3.png');
    final frame4 = await Sprite.load('characters/bird_frame_4.png');

    final animation = SpriteAnimation.spriteList(
      [frame2, frame3, frame4],
      stepTime: 0.08,
      loop: false,
    );

    wingFlapTicker = animation.createTicker();

    sprite = wingUpSprite;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!isStarted) return;

    velocityY += gravity * dt;
    position.y += velocityY * dt;

    if (position.y > game.size.y) {
      position.y = game.size.y;
      velocityY = 0;
    }

    if (wingFlapTicker != null && !wingFlapTicker!.done()) {
      wingFlapTicker!.update(dt);
      sprite = wingFlapTicker!.getSprite();
    } else {
      sprite = wingUpSprite;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    isStarted = true;
    velocityY = jumpSpeed;

    wingFlapTicker?.reset();
  }
}
