import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final H1 = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 72,
    color: colorwhite,
  ),
);
final H1black = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 72,
    color: colorblack,
  ),
);
final H2 = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 42,
    color: colorgreydark,
  ),
);
final H3 = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 24,
    color: colorgreydark,
  ),
);
final bodyf = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 14,
    color: colorlightgrey,
  ),
);
final bodyblack = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 16,
    color: colorblack,
  ),
);

// colors
const colorPrimary = Color(0xFFDF46DC);
const colorHighlights = Color(0xFF0EACD7);
const colorlightgrey = Color.fromARGB(255, 121, 121, 121);
const colorwhite = Color(0xFFffffff);
const colorblack = Color(0xFF111B19);
const colorgreydark = Color(0XFF444444);

//
const String rayanabaseurl="https://sandbox.raynatours.com/api/Tour";
const String Apikey = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w";