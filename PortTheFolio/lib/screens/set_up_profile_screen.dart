import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  @override
  State<SetUpProfileScreen> createState() => SetUpProfileScreenState();
}

class SetUpProfileScreenState extends State<SetUpProfileScreen> {
  final _nameController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose;
    _detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(color: Colors.transparent),
        )),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        centerTitle: true,
        title: Text(
          'Set Up',
          style: GoogleFonts.dmSans(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Text(
                "Let's set up your profile! 😄",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 250,
              decoration: new BoxDecoration(),
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 0.0),
                child: Container(
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=65',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextFormField(
                            controller: _detailsController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: OutlineInputBorder(),
                              hintText: "Name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: SizedBox(
                            // height: 80,
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                border: OutlineInputBorder(),
                                hintText: "Some details about you",
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration:
                      new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
