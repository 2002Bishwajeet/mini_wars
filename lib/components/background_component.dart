import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:mini_wars/mini_wars.dart';

class Background extends ParallaxComponent<MiniWars> {
  final _layersMeta = {
    'spritesheets/background/1.png': 1.0,
    'spritesheets/background/2.png': 1.5,
    'spritesheets/background/3.png': 2.3,
    'spritesheets/background/4.png': 3.8,
  };

  @override
  Future<void> onLoad() async {
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
      baseVelocity: Vector2(8.5, 0),
      size: Vector2(32, 555),
    );
  }
}
