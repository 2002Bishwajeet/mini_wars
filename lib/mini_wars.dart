import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'components/background_component.dart';

class MiniWars extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Future<void> onLoad() async {
    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.load('choti_bachi.mp3');
    // FlameAudio.bgm.play('choti_bachi.mp3');
    add(Background());
    // FlameAudio.bgm.dispose();
  }
}
