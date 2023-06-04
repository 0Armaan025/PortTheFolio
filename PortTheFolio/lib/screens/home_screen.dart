import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/custom_bottom_navigation_bar.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/add_post_screen.dart';
import 'package:rive_animation/widgets/post_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SMIBool homeTrigger;

  bool isSideMenuClosed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: signup_bg,
        onPressed: () {
          moveScreen(context, AddPostScreen());
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: StreamBuilder<PostgrestResponse>(
        stream: Supabase.instance.client
            .from('posts_table')
            .select()
            .execute()
            .asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final row = data[index];
                return PostWidget(
                  name: row['userName'],
                  profession: row['userProfession'],
                  postTitle: row['postTitle'],
                  postDescription: row['postDescription'],
                  githubLink: row['githubLink'],
                  email: row['userEmail'],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input,
      required this.src});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      artboard: "HOME",
      stateMachineName: "HOME_Interactivity",
      title: "Home",
      src: "assets/RiveAssets/animated_icons.riv"),
  RiveAsset(
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "CHAT",
      src: "assets/RiveAssets/animated_icons.riv"),
  RiveAsset(
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile",
      src: "assets/RiveAssets/animated_icons.riv")
];
