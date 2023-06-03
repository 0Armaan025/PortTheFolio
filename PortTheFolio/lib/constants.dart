import 'package:flutter/material.dart';

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
