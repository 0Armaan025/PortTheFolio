import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/user_portfolio.dart';

import 'package:http/http.dart' as http;
import 'package:rive_animation/screens/portfolio/portfolio_code_screen.dart';
import '../../components/custom_bottom_navigation_bar.dart';
import '../../credentials/supabase.credentials.dart';

class ChooseThemeScreen extends StatefulWidget {
  final UserPortfolio model;
  const ChooseThemeScreen({super.key, required this.model});

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  bool isTheme1Chosen = false;
  bool isTheme2Chosen = false;
  bool isTheme3Chosen = false;

  String _generatedText = "";

  @override
  void initState() {
    super.initState();
    updateValue();
  }

  updateValue() async {
    final response = await SupaBaseCredentials()
        .supabaseClient
        .from('user_table')
        .update({'portfolioStory': widget.model.journeyStory.trim()})
        .eq('email', email)
        .execute();
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
      // Post Api Url
      var url = Uri.parse('https://api.openai.com/v1/completions');
      //  use post method of http and pass url,headers and body according to documents
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiSecretKey"
          },
          body: json.encode(requestBody)); // post call
      // Checked we get the response or not
      // if status code is 200 then Api Call is Successfully Executed
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
                onTap: () async {
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
                  String theme = "";
                  if (isTheme1Chosen == true) {
                    theme = "Classic";
                  } else if (isTheme2Chosen == true) {
                    theme = "Horror";
                  } else {
                    theme = "Ups and Downs";
                  }
                  setState(() {});

                  UserPortfolio newModel = UserPortfolio(
                      name: widget.model.name,
                      email: widget.model.email,
                      profession: widget.model.profession,
                      experience: widget.model.experience,
                      internExperience: widget.model.internExperience,
                      project1Title: widget.model.project1Title,
                      project1Overview: widget.model.project1Overview,
                      project2Title: widget.model.project2Title,
                      project2Overview: widget.model.project2Overview,
                      journeyStory: widget.model.journeyStory,
                      theme: theme);

                  print(newModel);

                  String answer = await generateText(
                      "Write html index.html code for an amazing design portfolio the data to add is ${newModel}, add amazing theme according to ${newModel.theme} , add colors, make boxes, shapes , add amazing ui and more details");
                  _generatedText = answer;
                  print(_generatedText);

                  moveScreen(
                      context,
                      PortfolioCodeScreen(
                        portfolioCode: _generatedText,
                      ),
                      isPushReplacement: true);

                  // print(model);
                  setState(() {});
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
