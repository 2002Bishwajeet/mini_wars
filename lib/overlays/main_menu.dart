import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_wars/components/player_component.dart';
import 'package:mini_wars/mini_wars.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../api/auth/authentication.dart';
import '../providers/auth.dart';

class MainMenu extends ConsumerStatefulWidget {
  final MiniWars gameRef;
  static const routename = '/LoginPage';
  const MainMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends ConsumerState<MainMenu> {
  ///  A loading variable to show the loading animation when you a function is ongoing
  bool _isLoading = false;

  ///  This function is used to show a spinning Indicator when the function is ongoing
  void _loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  late final Authentication auth = ref.watch(authProvider);

  Future<void> _onPressedFunction() async {
    _loading();
    await auth.login(context);

    _loading();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, type) => Scaffold(
        backgroundColor: Colors.black87.withOpacity(0.4),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                right: 20,
                top: 20,
                child: MaterialButton(
                  onPressed: _onPressedFunction,
                  color: Colors.green.shade700,
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.primary,
                  minWidth: 100,
                  padding: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.green.shade700),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.discord),
                      Text(
                        ' Login with Discord',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.green.shade700,
                    baseColor: Colors.green.shade900,
                    period: const Duration(seconds: 5),
                    child: Text(
                      'Mini Wars',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontFamily: 'thesims', color: Colors.green.shade900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 15.w,
                    height: 8.h,
                    child: MaterialButton(
                      onPressed: () {
                        widget.gameRef.overlays.remove(MainMenu.routename);
                        widget.gameRef.add(Player());
                      },
                      color: Colors.green.shade700,
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.primary,
                      minWidth: 100,
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.green.shade700),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
