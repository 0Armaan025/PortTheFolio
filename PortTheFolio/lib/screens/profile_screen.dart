import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/components/custom_bottom_navigation_bar.dart';
import 'package:rive_animation/screens/loading_screen_2.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: CircleAvatar(
                  radius: 57,
                  backgroundColor: Colors.yellow,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: FileImage(imageFile!),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  username,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Chip(
                backgroundColor: Colors.green,
                label: Text(
                  profession,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: backgroundColor2,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    personDetails,
                    style: GoogleFonts.roboto(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  moveScreen(context, LoadingScreen2());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Check your admin dashboard! 🔥",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  moveScreen(context, LoadingScreen2());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Make your portfolio! 😄",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
