import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_wars/mini_wars.dart';

enum PlayerState {
  idle,
  crouch,
  crouchShoot,
  hithurt,
  running,
  jumping,
  landing,
  dead,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with KeyboardHandler {
  Player()
      : super(
          size: Vector2.all(6.2),
          anchor: Anchor.center,
          current: PlayerState.idle,
        );

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation crouchAnimation;
  late final SpriteAnimation crouchShootAnimation;
  late final SpriteAnimation hithurtAnimation;
  late final SpriteAnimation runningAnimation;
  late final SpriteAnimation jumpingAnimation;
  late final SpriteAnimation landingAnimation;
  late final SpriteAnimation deadAnimation;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.space)) {
        current = PlayerState.jumping;
      } else if (keysPressed.contains(LogicalKeyboardKey.controlLeft)) {
        current = PlayerState.crouch;
      } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
          keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        current = PlayerState.running;
        if (transform.scale.x == -1) transform.flipHorizontally();
      } else if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
          keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        current = PlayerState.running;
        if (transform.scale.x == 1) transform.flipHorizontally();
      }
    }
    if (event is RawKeyUpEvent) {
      current = PlayerState.idle;
    }

    return true;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await loadAnimatedSprites();
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.crouch: crouchAnimation,
      PlayerState.crouchShoot: crouchShootAnimation,
      PlayerState.hithurt: hithurtAnimation,
      PlayerState.running: runningAnimation,
      PlayerState.jumping: jumpingAnimation,
      PlayerState.landing: landingAnimation,
      PlayerState.dead: deadAnimation,
    };
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  Future<void> loadAnimatedSprites() async {
    idleAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_idle.png',
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: 0.25,
        textureSize: Vector2(26, 22),
      ),
    );

    crouchAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_crouch.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.25,
        loop: false,
        textureSize: Vector2(24, 26),
      ),
    );

    crouchShootAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_crouch_shoot.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.25,
        textureSize: Vector2(26, 26),
      ),
    );

    hithurtAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_hithurt.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.25,
        textureSize: Vector2(27, 21),
      ),
    );

    runningAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_run.png',
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.15,
        textureSize: Vector2(26, 22),
      ),
    );

    jumpingAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_jump.png',
      SpriteAnimationData.sequenced(
        amount: 9,
        stepTime: 0.25,
        textureSize: Vector2(26, 23),
      ),
    );

    landingAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_landing.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.25,
        textureSize: Vector2(26, 22),
      ),
    );

    deadAnimation = await SpriteAnimation.load(
      'spritesheets/player/john_dead.png',
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: 0.25,
        textureSize: Vector2(26, 22),
      ),
    );
  }
}

class Hero extends BodyComponent<MiniWars> with KeyboardHandler {
  final Vector2 position;
  final Vector2 size;
  Hero(
    this.position, {
    Vector2? size,
  })  : size = size ?? Vector2.all(6.0),
        super(
          paint: Paint()..color = const Color.fromARGB(0, 255, 255, 255),
        );

  final Vector2 velocity = Vector2(0, 0);
  static const int speed = 20000;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Player());
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    bool isDown = event is RawKeyDownEvent;

    const space = LogicalKeyboardKey.space;
    const a = LogicalKeyboardKey.keyA;
    const s = LogicalKeyboardKey.keyS;
    const d = LogicalKeyboardKey.keyD;

    if (event.logicalKey == space) {
      if (isDown) {
        velocity.y = -1;
      } else if (keysPressed.contains(s)) {
        velocity.y = 1;
      } else {
        velocity.y = 0;
      }
    } else if (event.logicalKey == s) {
      if (isDown) {
        velocity.y = 1;
      } else if (keysPressed.contains(space)) {
        velocity.y = -1;
      } else {
        velocity.y = 0;
      }
    } else if (event.logicalKey == a) {
      if (isDown) {
        velocity.x = -1;
      } else if (keysPressed.contains(d)) {
        velocity.x = 1;
      } else {
        velocity.x = 0;
      }
    } else if (event.logicalKey == d) {
      if (isDown) {
        velocity.x = 1;
      } else if (keysPressed.contains(a)) {
        velocity.x = -1;
      } else {
        velocity.x = 0;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  Body createBody() {
    final shape = PolygonShape();

    final vertices = [
      Vector2(-size.x / 2, size.y / 2),
      Vector2(size.x / 2, size.y / 2),
      Vector2(size.x / 2, -size.y / 2),
      Vector2(-size.x / 2, -size.y / 2),
    ];
    shape.set(vertices);

    final fixtureDef = FixtureDef(
      shape,
      userData: this, // To be able to determine object in collision
      restitution: 0,
      density: 50.0,
      friction: 0.5,
    );

    final bodyDef = BodyDef(
      position: position,
      angle: (position.x + position.y) / 2 * pi,
      type: BodyType.dynamic,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void update(double dt) {
    super.update(dt);
    final impulse = velocity * (speed * dt);
    body.applyLinearImpulse(impulse);

    // body.position.add(displacement);
    // print(body.position);
  }
}
