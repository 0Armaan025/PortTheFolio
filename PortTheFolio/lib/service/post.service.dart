import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostService {
  void addPost(
      BuildContext context,
      String postTitle,
      String postDescription,
      String userName,
      String githubLink,
      String userProfession,
      String userEmail) async {
    try {
      final supabase = Supabase.instance.client;
      final User? user = supabase.auth.currentUser;
      final data = {
        'postTitle': postTitle,
        'postDescription': postDescription,
        'githubLink': githubLink,
        'userName': userName,
        'views': 0,
        'userEmail': userEmail,
        'userProfession': userProfession,
      };

      await supabase.from('posts_table').insert(data).execute();
    } catch (e) {
      showAwesomeSnackBar(context, "Oops!", e.toString());
    }
  }
}
