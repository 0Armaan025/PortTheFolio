import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// Let's run the app rn

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
      //let's restart the app and check
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //At the end we'll also learn to make it
          //let's  make it a bit blurry
          Positioned(
            // height: 100,
            bottom: 100,
            left: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
              child: BackdropFilter(
            //now it looks perfect
            //see how easy
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
            child: const SizedBox(),
          )),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
              child: BackdropFilter(
            //now it looks perfect
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 30,
            ),
            child: const SizedBox(),
          )),

          //let's add some text to it
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  width: 400,
                  child: Column(
                    children: const [
                      Text(
                        "Let's understand the Portfolios",
                        style: TextStyle(
                            fontSize: 45, fontFamily: "Poppins", height: 1),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Understand the Portfolios with better perspective, Portfolios matter!")
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                //It's time to add the animated button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
                  },
                  child: AnimatedButton(
                      btnAnimationController: _btnAnimationController),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                      "Let's make amazing portfolios based on templates, meet amazing people, and get to know portfolios from another perspective!"),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController btnAnimationController,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //see when you now tap it, it shows the animation
        //but on restart, it plays it once too
        // let's fix it
        //let's move t o auth screen

        _btnAnimationController.isActive = true;
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AuthScreen()));
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            //just a btn?
            //no animations? let's add it

            //Once we restart the app , it shows the aniamtion
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.arrow_right),
                  Text(
                    "Let's begin!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
