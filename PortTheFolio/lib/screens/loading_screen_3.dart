import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/user_portfolio.dart';

import 'entry_point_for_story_narrative_screen.dart';

class LoadingScreen3 extends StatefulWidget {
  final UserPortfolio model;
  const LoadingScreen3({super.key, required this.model});

  @override
  State<LoadingScreen3> createState() => _LoadingScreen3State();
}

class _LoadingScreen3State extends State<LoadingScreen3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 3000),
      () => moveScreenWithTransition(
          context,
          EntryPointForStoryNarrativeScreen(
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
                  'https://assets9.lottiefiles.com/private_files/lf30_cldvedro.json'),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Text(
              "Writing down your ideas...",
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
