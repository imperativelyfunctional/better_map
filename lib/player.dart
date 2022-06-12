import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Dummy extends SimplePlayer with ObjectCollision, Lighting {
  static const double maxSpeed = 6 * 32;
  bool canAttack = true;

  Dummy(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: Vector2(27, 48),
          position: position,
          speed: maxSpeed,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea(RectangleShape(Vector2(21, 24)), align: Vector2(0, 24))
    ]));

    setupLighting(LightingConfig(radius: 100, color: Colors.blueAccent.withAlpha(1)));
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    speed = maxSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }
}

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "tiled/player.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(26, 48),
          texturePosition: Vector2(27 * 3, 0),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "tiled/player.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(26, 48),
          texturePosition: Vector2(27 * 2, 0),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "tiled/player.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(26, 48),
          texturePosition: Vector2(27, 0),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "tiled/player.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(26, 48),
          texturePosition: Vector2(0, 0),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        runRight: runRight,
        runLeft: runLeft,
        runDown: runDown,
        runUp: runUp,
        idleRight: runRight,
        idleLeft: runLeft,
        idleUp: runUp,
        idleDown: runDown,
      );
}
