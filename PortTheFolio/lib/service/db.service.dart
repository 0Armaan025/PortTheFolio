import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class DBService {
  final supabase = Supabase.instance.client;

  void addData(BuildContext context, String name, String personDetails) async {
    final User? user = supabase.auth.currentUser;

    try {
      final data = {
        'email': user!.email,
        'name': name,
        'personDetails': personDetails,
        'portfolioMainParagraph': '',
        'amountOfViews': 0,
        'amountOfListens': 0,
      };

      await supabase.from('user_table').insert(data).execute();
    } catch (e) {
      print(e.toString());
    }
  }
}
