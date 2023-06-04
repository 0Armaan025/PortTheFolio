import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';

import '../entrypoint_screens/entry_point_for_portfolio_making_startup_screen.dart';

class LoadingScreen2 extends StatefulWidget {
  const LoadingScreen2({super.key});

  @override
  State<LoadingScreen2> createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 3000),
      () => moveScreenWithTransition(
          context, EntryPointForPortfolioMakingStartUpScreen()),
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
                  'https://assets7.lottiefiles.com/packages/lf20_q07pKG.json'),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Text(
              "Porting...",
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
