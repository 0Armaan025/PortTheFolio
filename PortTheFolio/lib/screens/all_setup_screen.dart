import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/entry_point.dart';

import 'package:rive_animation/widgets/glowing_btn.dart';

class AllSetupScreen extends StatefulWidget {
  const AllSetupScreen({super.key});

  @override
  State<AllSetupScreen> createState() => _AllSetupScreenState();
}

class _AllSetupScreenState extends State<AllSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_g9gACcXlja.json'),
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Text(
                'Yay!, you are fully setup\nto start the porting process\nof your portfolio!',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                moveScreen(context, EntryPoint());
              },
              child: GlowingButton(),
            ),
          ],
        ),
      ),
    );
  }
}
