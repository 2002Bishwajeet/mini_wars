import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:mini_wars/components/game_background_component.dart';
import 'package:mini_wars/components/player_component.dart';

import 'components/background_component.dart';

class MiniWars extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  MiniWars() : super();
  final Background mainMenubackground = Background();
  final GameBackground gameBackground = GameBackground();
  final Player hero = Player();

  double gravity = 10.0;
  double velocityX = 0.0;
  double velocityY = 0.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.load('choti_bachi.mp3');
    // FlameAudio.bgm.play('choti_bachi.mp3');
    add(mainMenubackground);
    // FlameAudio.bgm.dispose();bac

    camera.followComponent(hero);
  }

  @override
  void update(double dt) {
    hero.position.y += 0;
    super.update(dt);
  }
}
