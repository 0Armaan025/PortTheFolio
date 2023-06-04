import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_animation/components/custom_bottom_navigation_bar.dart';
import 'package:rive_animation/constants.dart';

class PortfolioCodeScreen extends StatefulWidget {
  final String portfolioCode;
  const PortfolioCodeScreen({super.key, required this.portfolioCode});

  @override
  State<PortfolioCodeScreen> createState() => _PortfolioCodeScreenState();
}

class _PortfolioCodeScreenState extends State<PortfolioCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Portfolio Code!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GestureDetector(
                child: ExpansionTile(
                  // backgroundColor: Colors.lightGreen,
                  title: Text('Code Here'),
                  onExpansionChanged: (bool expanded) {},
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(widget.portfolioCode),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          Center(
              child: InkWell(
                onTap: () {
                  FlutterClipboard.copy(widget.portfolioCode);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Copy Code!",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
