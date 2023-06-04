import 'package:flutter/material.dart';

import '../components/custom_bottom_navigation_bar.dart';

class PortfolioMakingStartupScreen extends StatefulWidget {
  const PortfolioMakingStartupScreen({super.key});

  @override
  State<PortfolioMakingStartupScreen> createState() =>
      _PortfolioMakingStartupScreenState();
}

class _PortfolioMakingStartupScreenState
    extends State<PortfolioMakingStartupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Porting the Folio time!!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
