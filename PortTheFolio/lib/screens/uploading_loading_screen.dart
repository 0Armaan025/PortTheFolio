import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/entry_point.dart';
import 'package:rive_animation/screens/home_screen.dart';

class UploadingLoadingScreen extends StatefulWidget {
  const UploadingLoadingScreen({super.key});

  @override
  State<UploadingLoadingScreen> createState() => _UploadingLoadingScreenState();
}

class _UploadingLoadingScreenState extends State<UploadingLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      moveScreen(context, EntryPoint(), isPushReplacement: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 160,
            ),
            SizedBox(
              height: 400,
              width: 200,
              child: Center(
                child: Lottie.network(
                    'https://assets5.lottiefiles.com/private_files/lf30_aurflyqv.json'),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Center(
              child: Text(
                "Preparing to Launch the Upload!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
