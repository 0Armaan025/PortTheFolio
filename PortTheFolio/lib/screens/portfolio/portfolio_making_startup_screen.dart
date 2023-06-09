import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/models/user_portfolio.dart';

import '../../components/custom_bottom_navigation_bar.dart';
import '../../constants.dart';
import '../entrypoint_screens/entry_point_for_projects_experience_screen.dart';

class PortfolioMakingStartupScreen extends StatefulWidget {
  const PortfolioMakingStartupScreen({super.key});

  @override
  State<PortfolioMakingStartupScreen> createState() =>
      _PortfolioMakingStartupScreenState();
}

class _PortfolioMakingStartupScreenState
    extends State<PortfolioMakingStartupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _professionController = TextEditingController();
  final _experienceController = TextEditingController();
  final _internExperienceController = TextEditingController();

  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _professionController.dispose();
    _experienceController.dispose();
    _internExperienceController.dispose();
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
                "Let's fill some details!",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Center(
                child: Text(
                  "Please make sure that all these details\nare correct as they will be mentioned in your portfolio!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                radius: 47,
                backgroundColor: Colors.yellow,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: FileImage(imageFile!),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Email address",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextFormField(
                controller: _professionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Profession",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Experience",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextFormField(
                controller: _internExperienceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText:
                      "All experience about internships/other coding programs",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
                maxLength: null,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //button here

            Center(
              child: InkWell(
                onTap: () {
                  UserPortfolio portfolio = UserPortfolio(
                      name: _nameController.text,
                      email: _emailController.text,
                      profession: _professionController.text,
                      experience: _experienceController.text,
                      internExperience: _internExperienceController.text,
                      project1Title: '',
                      project1Overview: '',
                      project2Title: '',
                      project2Overview: '',
                      journeyStory: '',
                      theme: '');

                  setState(() {});
                  moveScreen(
                      context,
                      EntryPointForProjectsExperienceScreen(
                        model: portfolio,
                      ));
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Continue ->",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(22),
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
