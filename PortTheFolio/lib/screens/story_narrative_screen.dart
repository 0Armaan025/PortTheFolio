import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/screens/loading_screen_4.dart';

import '../components/custom_bottom_navigation_bar.dart';
import '../constants.dart';

class StoryNarrativeScreen extends StatefulWidget {
  const StoryNarrativeScreen({super.key});

  @override
  State<StoryNarrativeScreen> createState() => _StoryNarrativeScreenState();
}

class _StoryNarrativeScreenState extends State<StoryNarrativeScreen> {
  final _storyController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _storyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Story Time!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "STORY TIME!",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 100,
                  child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_1khj96ox.json'),
                ),
                Text(
                  "We would love listening\nthe story of your journey yet!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _storyController,
                decoration: InputDecoration(
                    hintText:
                        "Please explain the story of your whole journey yet here",
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: "Your journey's story!"),
                maxLength: null,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  moveScreen(context, LoadingScreen4());
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Make a portfolio",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
