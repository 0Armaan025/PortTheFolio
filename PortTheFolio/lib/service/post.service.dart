import 'package:supabase_flutter/supabase_flutter.dart';

class PostService {
  void addPost(String postTitle, String postDescription, String userName,
      String githubLink, String userProfession) async {
    final supabase = Supabase.instance.client;
    final User? user = supabase.auth.currentUser;
    final data = {
      'postTitle': postTitle,
      'postDescription': postDescription,
      'githubLink': githubLink,
      'userName': userName,
      'views': 0,
      'userProfession': userProfession,
    };

    await supabase.from('posts_table').insert(data).execute();
  }
}
