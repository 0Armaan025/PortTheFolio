import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/entry_point.dart';
import 'package:rive_animation/screens/entry_point_for_profile_screen.dart';
import 'package:rive_animation/screens/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      if (index == 2) {
                        moveScreen(context, EntryPointForProfileScreen());
                      } else if (index == 0) {
                        moveScreen(context, EntryPoint());
                      }

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
    );
  }
}
