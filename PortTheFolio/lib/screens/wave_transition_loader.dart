import 'package:flutter/material.dart';
import 'package:rive_animation/screens/set_up_profile_screen.dart';

class WaveTransitionLoader extends StatefulWidget {
  const WaveTransitionLoader({super.key});

  @override
  State<WaveTransitionLoader> createState() => _WaveTransitionLoaderState();
}

class _WaveTransitionLoaderState extends State<WaveTransitionLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1500),
                child: SetUpProfileScreen(),
                builder: (context, value, child) {
                  return ShaderMask(
                    blendMode: BlendMode.modulate,
                    shaderCallback: (rect) {
                      return RadialGradient(
                          radius: value * 5,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.55, 0.6, 1.0],
                          center: FractionalOffset(
                            0.95,
                            .90,
                          )).createShader(rect);
                    },
                    child: child,
                  );
                }),
          );
        },
      ),
    );
  }
}
