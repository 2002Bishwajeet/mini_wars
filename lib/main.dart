import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_wars/mini_wars.dart';
import 'package:mini_wars/utils/overlay_routes.dart';
import 'package:mini_wars/utils/theme.dart';

import 'overlays/main_menu.dart';
import 'providers/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const ProviderScope(child: MainApp()));
}

final _gameObject = MiniWars();

class MainApp extends ConsumerStatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  Future<void> _init(WidgetRef ref) async {
    //  This is how you can access providers in stateful widgets
    final user = await ref.read(userProvider.future);
    if (user != null) {
      ref.read(userLoggedInProvider.state).state = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Wars',
      theme: MiniWarsTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: GameWidget(
        game: _gameObject,
        overlayBuilderMap: overlayRoutes,
        loadingBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        initialActiveOverlays: const [MainMenu.routename],
      ),
    );
  }
}
