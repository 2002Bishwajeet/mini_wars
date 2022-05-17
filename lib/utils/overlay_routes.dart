import 'package:flutter/widgets.dart';
import 'package:mini_wars/overlays/main_menu.dart';

import '../mini_wars.dart';

final Map<String, Widget Function(BuildContext, MiniWars)> overlayRoutes = {
  MainMenu.routename: (p0, p1) => const MainMenu()
};
