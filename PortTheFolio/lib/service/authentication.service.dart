import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  void signUp(BuildContext context, String email, String password) async {
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    // if(res.)
    final Session? session = res.session;

    final User? user = res.user;
  }


  
}
