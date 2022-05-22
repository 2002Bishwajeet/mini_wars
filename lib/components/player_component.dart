import 'package:flame/components.dart';

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

class Player extends SpriteAnimationGroupComponent<PlayerState> {
  Player()
      : super(
            position: Vector2.all(64.0),
            size: Vector2.all(64.0),
            anchor: Anchor.center);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation crouchAnimation;
  late final SpriteAnimation crouchShootAnimation;
  late final SpriteAnimation hithurtAnimation;
  late final SpriteAnimation runningAnimation;
  late final SpriteAnimation jumpingAnimation;
  late final SpriteAnimation landingAnimation;
  late final SpriteAnimation deadAnimation;

  @override
  Future<void> onLoad() async {
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
    current = PlayerState.landing;
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
