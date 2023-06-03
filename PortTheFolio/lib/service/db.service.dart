import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBServices {
  final supabase = Supabase.instance.client;

  void addData(BuildContext context, String name, String personDetails) async {
    final tableName = 'user_table';
    final User? user = supabase.auth.currentUser;

    //unqiue user id which we can generate by user!.email + user!.createdAt

    final String userUniqueId =
        user!.email.toString() + user.createdAt.toString();

    final data = {
      'id': userUniqueId,
      'email': user.email,
      'name': name,
      'personDetails': personDetails,
      'portfolioMainParagraph': '',
      'amountOfViews': 0,
      'amountOfListens': 0,
    };

    await supabase.from(tableName).insert(data).execute();
  }
}
