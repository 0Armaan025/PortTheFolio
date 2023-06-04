import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

import '../components/custom_bottom_navigation_bar.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({super.key});

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  bool isTheme1Chosen = false;
  bool isTheme2Chosen = false;
  bool isTheme3Chosen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Themes!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose a theme for your portfolio!",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GestureDetector(
                onTap: () {
                  isTheme1Chosen = true;
                  isTheme2Chosen = false;
                  isTheme3Chosen = false;
                  setState(() {});
                },
                child: ExpansionTile(
                  // backgroundColor: Colors.lightGreen,
                  title: Text('Classic Theme'),
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      isTheme1Chosen = expanded;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          'It includes "Poppins" font , a classic background color and clear explanation, with classic bg music and normal tts voice'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GestureDetector(
                onTap: () {
                  isTheme1Chosen = false;
                  isTheme2Chosen = true;
                  isTheme3Chosen = false;
                  setState(() {});
                },
                child: ExpansionTile(
                  // backgroundColor: Colors.lightGreen,
                  title: Text('Horror'),
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      isTheme2Chosen = expanded;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          'It includes "Roboto" font , some dark background color and horror explanation, with horror bg music and high pitched tts voice'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GestureDetector(
                onTap: () {
                  isTheme1Chosen = false;
                  isTheme2Chosen = false;
                  isTheme3Chosen = true;
                  setState(() {});
                },
                child: ExpansionTile(
                  // backgroundColor: Colors.lightGreen,
                  title: Text('Ups and Downs'),
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      isTheme2Chosen = expanded;
                      isTheme1Chosen = false;
                      isTheme3Chosen = false;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          'It includes "Noto Sans" font , amazing background color with bullet points, precise explanation, color where need, with motivational bg music and normal pitched tts voice'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (!isTheme1Chosen && !isTheme2Chosen && !isTheme3Chosen) {
                    MotionToast.info(
                      title: Text("No Theme chosen"),
                      description: Text("Please choose any one of the themes"),
                    ).show(context);
                  } else {
                    MotionToast.success(
                      title: Text("Amazing!"),
                      description: Text(
                          "Your theme has been chosen, making your portfolio now!"),
                    ).show(context);
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  child: Text(
                    "Awesome! Make it! ✨🔥",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
