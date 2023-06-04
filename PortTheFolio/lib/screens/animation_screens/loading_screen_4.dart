import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/user_portfolio.dart';

import '../entrypoint_screens/entry_point_for_choose_theme.dart';

class LoadingScreen4 extends StatefulWidget {
  final UserPortfolio model;
  const LoadingScreen4({super.key, required this.model});

  @override
  State<LoadingScreen4> createState() => _LoadingScreen4State();
}

class _LoadingScreen4State extends State<LoadingScreen4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 2500),
      () => moveScreenWithTransition(
          context,
          EntryPointForChooseTheme(
            model: widget.model,
          )),
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
                  'https://assets8.lottiefiles.com/packages/lf20_fQij9m.json'),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Text(
              "Trying to build...",
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
