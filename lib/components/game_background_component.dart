import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:mini_wars/mini_wars.dart';

class GameBackground extends ParallaxComponent<MiniWars> {
  Vector2 lastCameraPosition = Vector2.zero();

  GameBackground() : super();
  final _layersMeta = {
    'spritesheets/background/1.png': 1.0,
    'spritesheets/background/2.png': 1.5,
    'spritesheets/background/3.png': 2.3,
    'spritesheets/background/4.png': 3.8,
  };

  @override
  Future<void> onLoad() async {
    positionType = PositionType.viewport;
    final bgLayer = await gameRef.loadParallaxLayer(
      ParallaxImageData(_layersMeta.keys.first),
    );
    final bgLayer2 = await gameRef.loadParallaxLayer(
      ParallaxImageData(_layersMeta.keys.elementAt(1)),
      velocityMultiplier: Vector2(_layersMeta.entries.elementAt(1).value, 0),
    );
    final bgLayer3 = await gameRef.loadParallaxLayer(
      ParallaxImageData(_layersMeta.keys.elementAt(2)),
      velocityMultiplier: Vector2(_layersMeta.values.elementAt(2), 0),
    );
    final bgLayer4 = await gameRef.loadParallaxLayer(
      ParallaxImageData(_layersMeta.keys.elementAt(3)),
      velocityMultiplier: Vector2(_layersMeta.values.elementAt(3), 0),
      fill: LayerFill.none,
    );

    parallax = Parallax(
      [
        bgLayer,
        bgLayer2,
        bgLayer3,
        bgLayer4,
      ],
      size: Vector2(32, 555),
    );
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    final cameraPosition = gameRef.camera.position;
    final delta = dt > threshold ? 1.0 / (dt * framesPerSec) : 1.0;
    final baseVelocity = cameraPosition
      ..sub(lastCameraPosition)
      ..multiply(backgroundVelocity)
      ..multiply(Vector2(delta, delta));
    parallax!.baseVelocity.setFrom(baseVelocity);
    lastCameraPosition.setFrom(gameRef.camera.position);
  }

  static final backgroundVelocity = Vector2(3.0, 0);
  static const framesPerSec = 60.0;
  static const threshold = 0.005;
}
