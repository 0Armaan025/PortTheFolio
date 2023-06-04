import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/constants.dart';

import 'package:http/http.dart' as http;
import 'package:text_to_speech/text_to_speech.dart';

import '../components/custom_bottom_navigation_bar.dart';

class StoryTimeScreen extends StatefulWidget {
  final String email;
  const StoryTimeScreen({super.key, required this.email});

  @override
  State<StoryTimeScreen> createState() => _StoryTimeScreenState();
}

class _StoryTimeScreenState extends State<StoryTimeScreen> {
  String _generatedText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  Future<String> generateText(String prompt) async {
    // Here we have to create body based on the document
    try {
      Map<String, dynamic> requestBody = {
        "model": "text-davinci-003",
        "prompt": prompt,
        "temperature": 1,
        "max_tokens": 500,
      };
      var url = Uri.parse('https://api.openai.com/v1/completions');
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiSecretKey"
          },
          body: json.encode(requestBody)); // post call
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        _generatedText = responseJson["choices"][0]["text"];
        setState(() {});
        print('the generated text is $_generatedText');

        return responseJson["choices"][0]["text"];
      } else {
        return "Failed to generate text: ${response.body}";
      }
    } catch (e) {
      return "Failed to generate text: $e";
    }
  }

  final player = AudioPlayer();
  void getData() async {
    // final player = AudioPlayer();

    player.play(
      AssetSource('bg.mp3'),
    );
    String storyToSpeak = await generateText(
        "${personStory} make an inspirational story on this ${personStory}");
    final tts = TextToSpeech();
    tts.setRate(0.5);
    tts.speak(storyToSpeak);
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Listen peacefully and enjoy!",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
