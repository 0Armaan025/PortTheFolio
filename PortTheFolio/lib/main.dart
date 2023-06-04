import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/credentials/supabase.credentials.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: SupaBaseCredentials.API_URL,
    anonKey: SupaBaseCredentials.API_KEY,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // This widget is the root of your application.
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          errorStyle: TextStyle(height: 0),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: defpaultPadding * 1.2, horizontal: defpaultPadding),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color.fromARGB(255, 70, 75, 90),
    width: 1,
  ),
);
