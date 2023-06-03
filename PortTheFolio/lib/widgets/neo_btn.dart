import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeoBtn extends StatefulWidget {
  const NeoBtn({super.key});

  @override
  State<NeoBtn> createState() => _NeoBtnState();
}

class _NeoBtnState extends State<NeoBtn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Container(
        width: double.infinity,
        height: size.height * 0.08,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          "Continue",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
