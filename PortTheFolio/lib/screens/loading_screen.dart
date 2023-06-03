import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/wave_transition_loader.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 3000),
      () => moveScreenWithTransition(context, WaveTransitionLoader()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: Center(
              child: Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_x62chJ.json'),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Text(
              "Loading",
              style: GoogleFonts.poppins(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
