import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:mini_wars/components/game_background_component.dart';
import 'package:mini_wars/components/player_component.dart';
import 'package:mini_wars/utils/boundaries.dart';

import 'components/background_component.dart';

class MiniWars extends Forge2DGame with HasKeyboardHandlerComponents {
  MiniWars() : super(gravity: Vector2(0, 10), zoom: 10);
  final Background mainMenubackground = Background();
  final GameBackground gameBackground = GameBackground();
  final Hero hero = Hero(Vector2.all(32));

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.load('choti_bachi.mp3');
    // FlameAudio.bgm.play('choti_bachi.mp3');

    add(mainMenubackground);
    addAll(createBoundaries(this));
    // FlameAudio.bgm.dispose();
    // camera.followBodyComponent(hero);
    // camera.followComponent(hero);
  }
}
