import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const Color backgroundColor2 = Color(0xFF17203A);
const Color backgroundColorLight = Color(0xFFF2F6FF);
const Color backgroundColorDark = Color(0xFF25254B);
const Color shadowColorLight = Color(0xFF4A5367);
const Color shadowColorDark = Colors.black;

const Color login_bg = Color(0xFF00C470);
const Color signup_bg = Color(0xFF000A54);

bool signUpFormFieldTapped = false;
bool LogInFormFieldTapped = false;

const double defpaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);

moveScreen(BuildContext context, Widget screenName,
    {bool isPushReplacement = false}) {
  if (isPushReplacement) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screenName));
  } else {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screenName));
  }
}

moveScreenWithTransition(BuildContext context, Widget screenName,
    {bool isPushReplacement = false}) {
  Navigator.of(context)
      .pushReplacement(PageRouteBuilder(pageBuilder: (context, animation, _) {
    return screenName;
  }));
}

showAwesomeSnackBar(BuildContext context, String title, String content) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: '${title}',
      message: '${content}',
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

File? imageFile;

void pickImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  imageFile = File(image!.path);
}

String username = "";

String email = "";

String profession = "";
