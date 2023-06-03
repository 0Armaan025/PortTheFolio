import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SMIBool homeTrigger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: backgroundColor2.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        Future.delayed(Duration(seconds: 1), (() {}));
                        bottomNavs[index].input!.change(false);
                      },
                      child: SizedBox(
                        height: 36,
                        width: 36,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController controller =
                                RiveUtils.getRiveController(artboard,
                                    stateMachineName:
                                        bottomNavs[index].stateMachineName);

                            bottomNavs[index].input =
                                controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input,
      required this.src});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      artboard: "HOME",
      stateMachineName: "HOME_Interactivity",
      title: "Home",
      src: "assets/RiveAssets/animated_icons.riv"),
  RiveAsset(
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "CHAT",
      src: "assets/RiveAssets/animated_icons.riv"),
  RiveAsset(
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile",
      src: "assets/RiveAssets/animated_icons.riv")
];
