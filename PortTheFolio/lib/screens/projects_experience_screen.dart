import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/loading_screen_3.dart';

import '../components/custom_bottom_navigation_bar.dart';

class ProjectsExperienceScreen extends StatefulWidget {
  const ProjectsExperienceScreen({super.key});

  @override
  State<ProjectsExperienceScreen> createState() =>
      _ProjectsExperienceScreenState();
}

class _ProjectsExperienceScreenState extends State<ProjectsExperienceScreen> {
  final _project1TitleController = TextEditingController();
  final _project2TitleController = TextEditingController();
  final _project1OverviewController = TextEditingController();
  final _project2OverviewController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _project1TitleController.dispose();
    _project2TitleController.dispose();
    _project1OverviewController.dispose();
    _project2OverviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Porting the Folio time!!',
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
                "Please add some of your\nmajor projects here!\nMin. 2 Projects",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _project1TitleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: "Project 1 title"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _project1OverviewController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: "Project 1 Overview"),
                maxLength: null,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _project2TitleController,
                decoration: InputDecoration(
                    hintText: "Please explain the full project idea",
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: "Project 2 title"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _project2OverviewController,
                decoration: InputDecoration(
                    hintText: "Please explain the full project idea",
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: "Project 2 Overview"),
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
                  moveScreen(context, LoadingScreen3());
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Continue ->",
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
