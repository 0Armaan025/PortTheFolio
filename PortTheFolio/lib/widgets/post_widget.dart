import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/entry_point_for_profile_screen_for_viewers.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatefulWidget {
  final String name;
  final String profession;
  final String postTitle;
  final String email;
  final String postDescription;
  final String githubLink;
  const PostWidget(
      {super.key,
      required this.email,
      required this.name,
      required this.profession,
      required this.postTitle,
      required this.postDescription,
      required this.githubLink});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }

  Uri _uri = Uri.parse('');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _uri = Uri.parse(widget.githubLink);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.37,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      moveScreen(
                          context,
                          EntryPointForProfileScreenForViewers(
                            email: widget.email,
                          ));
                    },
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.yellow,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(imageFile!),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                      child: Chip(
                        label: Text(profession),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.postTitle,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Text(
                widget.postDescription,
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: double.infinity,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  _launchUrl;
                },
                child: Text(
                  widget.githubLink,
                  style: GoogleFonts.montserrat(color: Colors.white60),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade600,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
