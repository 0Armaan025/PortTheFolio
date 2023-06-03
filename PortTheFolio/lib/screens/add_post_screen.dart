import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/uploading_loading_screen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _postTitleController = TextEditingController();
  final _postDescriptionController = TextEditingController();
  final _githubLinkController = TextEditingController();

  void dispose() {
    super.dispose();
    _postDescriptionController.dispose();
    _postTitleController.dispose();
    _githubLinkController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: Text("Add A Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Let's upload a Post! 😄",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 250,
                child: Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_iv4dsx3q.json'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Add a project and motivate others!\nPortTheFolio🔥",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 400,
              child: Card(
                elevation: 2.0,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: TextFormField(
                          controller: _postTitleController,
                          decoration: InputDecoration(
                            hintText: "Post Title",
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: TextFormField(
                          controller: _postDescriptionController,
                          maxLength: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Post Description",
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: TextFormField(
                          controller: _githubLinkController,
                          decoration: InputDecoration(
                            hintText: "Github Link",
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            moveScreen(context, UploadingLoadingScreen(),
                                isPushReplacement: true);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE5B4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Upload.",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
