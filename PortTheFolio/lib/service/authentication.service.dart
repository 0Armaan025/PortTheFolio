import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../screens/animation_screens/loading_screen.dart';

class AuthenticationService {
  final supabase = Supabase.instance.client;
  void signUp(BuildContext context, String email, String password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    // if(res.)
    // final Session? session = res.session;

    // final User? user = res.user;

    moveScreen(context, LoadingScreen());
  }

  void signIn(BuildContext context, String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      moveScreen(context, LoadingScreen(), isPushReplacement: true);
      // final Session? session = res.session;
      // final User? user = res.user;
    } catch (e) {
      showAwesomeSnackBar(context, "Oops!", e.toString());
    }
  }
}
