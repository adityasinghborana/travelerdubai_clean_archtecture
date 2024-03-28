import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final H1 = GoogleFonts.playfairDisplay(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 40,
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
final H3 = GoogleFonts.outfit(
  textStyle: TextStyle(
    letterSpacing: .5,
    fontSize: Get.width * .016,
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
  textStyle: TextStyle(
    letterSpacing: .5,
    color: colorblack,
  ),
);

final ratingStyle = GoogleFonts.outfit(
  textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Get.width * 0.015,
      height: 1.26,
      color: colorgreydark),
);

// colors

final LinearGradient backgroundgradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFFC41FF).withOpacity(0.1), // #FC41FF
    Color(0xFF34E2FE).withOpacity(0.1), // #34E2FE
  ],
  transform: GradientRotation(
      180 * 3.14159265359 / 180), // Converting degrees to radians
);

final LinearGradient imageGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    Color.fromRGBO(0, 0, 0, 0.75),
    Colors.transparent,
  ],
  stops: [0.1, 0.5],
  // Converting degrees to radians
);

const colorPrimary = Color(0xFFDF46DC);
const colorHighlights = Color(0xFF0EACD7);
const colorlightgrey = Color.fromARGB(255, 121, 121, 121);
const color_EEEEEE = Color(0xFFEEEEEE);

const colorTextgrey = Color(0xff808080);
const colorwhite = Color(0xFFffffff);
const colorblack = Color(0xFF111B19);
const colorDarkblack = Color(0xFF000000);
const colorgreydark = Color(0XFF444444);
const colorblue = Color(0XFF2659C3);
const colorgreenishblack = Color(0xff112211);
const colorDarkBlue = Color(0xff141A2F);

// others
const String baseurl = "http://69.48.163.45:3000";
const String Apikey =
    "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w";

// bgColor: Color(0xffffffff),
// txtColor: Color(0xff112211)
