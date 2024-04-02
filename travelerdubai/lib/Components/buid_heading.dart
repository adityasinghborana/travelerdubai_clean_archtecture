import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildHeading(String heading) {
  return Center(
    child: SelectableText(
      heading,
      style: GoogleFonts.playfairDisplay(
        textStyle: const TextStyle(
            color: Colors.black,
            letterSpacing: .5,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
