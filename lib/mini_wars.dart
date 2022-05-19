import 'package:flame/game.dart';
import 'package:mini_wars/components/background_component.dart';

class MiniWars extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(Background());
  }
}
