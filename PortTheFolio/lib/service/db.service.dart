import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/all_setup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;

  void addData(BuildContext context, String name, String personDetails) async {
    final User? user = supabase.auth.currentUser;

    try {
      addBucket(context, personDetails, name);
    } catch (e) {
      print(e.toString());
    }
  }

  void addBucket(
      BuildContext context, String personDetails, String name) async {
    final User? user = supabase.auth.currentUser;

    final data = {
      'email': user!.email,
      'name': name,
      'personDetails': personDetails,
      'portfolioMainParagraph': '',
      'amountOfViews': 0,
      'amountOfListens': 0,
    };

    await supabase.from('user_table').insert(data).execute();
    moveScreen(context, AllSetupScreen());
  }
}
