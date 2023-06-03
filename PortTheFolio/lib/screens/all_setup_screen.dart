import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AllSetupScreen extends StatefulWidget {
  const AllSetupScreen({super.key});

  @override
  State<AllSetupScreen> createState() => _AllSetupScreenState();
}

class _AllSetupScreenState extends State<AllSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_g9gACcXlja.json'),
          ],
        ),
      ),
    );
  }
}
