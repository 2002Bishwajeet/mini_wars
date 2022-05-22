import 'package:flame/game.dart';

import 'components/background_component.dart';

class MiniWars extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(Background());
  }
}
