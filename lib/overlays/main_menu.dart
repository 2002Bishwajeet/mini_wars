import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_wars/mini_wars.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MainMenu extends ConsumerStatefulWidget {
  final MiniWars gameRef;
  static const routename = '/LoginPage';
  const MainMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends ConsumerState<MainMenu> {
  Future<void> _onPressedFunction() async {
    //  TODO: Implement this function
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
                  minWidth: 20,
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
                    highlightColor: Colors.green.shade500,
                    baseColor: Colors.green.shade700,
                    period: const Duration(seconds: 5),
                    child: Text(
                      'Mini Wars',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontFamily: 'thesims',
                          color: Colors.green.shade900,
                          fontSize: type == DeviceType.web ? 28.0.sp : 64.0.sp),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: !(type == DeviceType.web)
                        ? type == DeviceType.windows
                            ? 17.w
                            : 36.w
                        : 15.w,
                    height: !(type == DeviceType.web)
                        ? type == DeviceType.windows
                            ? 4.h
                            : 7.h
                        : 8.h,
                    child: MaterialButton(
                      onPressed: () {
                        //  TODO:
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
