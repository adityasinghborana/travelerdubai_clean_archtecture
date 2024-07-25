import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final H1black = GoogleFonts.outfit(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 72,
    color: colorblack,
  ),
);

TextStyle H1(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize;

  // Define font sizes based on screen width
  if (screenWidth < 600) {
    fontSize = screenWidth * 0.056; // For smaller screens like mobile
  } else {
    fontSize = 35.0; // For larger screens
  }

  return GoogleFonts.outfit(
      textStyle: TextStyle(
    letterSpacing: .5,
    fontSize: fontSize,
    color: colorwhite,
  ));
}

TextStyle H1open(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize;

  // Define font sizes based on screen width
  if (screenWidth < 600) {
    fontSize = screenWidth * 0.056; // For smaller screens like mobile
  } else {
    fontSize = 48.0; // For larger screens
  }

  return GoogleFonts.openSans(
      textStyle: TextStyle(
    letterSpacing: .5,
    fontSize: fontSize,
    color: colorwhite,
  ));
}

TextStyle bodygrey(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize;

  // Define font sizes based on screen width
  if (screenWidth < 600) {
    fontSize = screenWidth * 0.036; // For smaller screens like mobile
  } else {
    fontSize = 35.0; // For larger screens
  }

  return GoogleFonts.roboto(
      textStyle: TextStyle(
    letterSpacing: .5,
    fontSize: fontSize,
    color: Color(0xff505050),
  ));
}

TextStyle getH2TextStyle(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize;

  // Define font sizes based on screen width
  if (screenWidth < 600) {
    fontSize = screenWidth * 0.056; // For smaller screens like mobile
  } else {
    fontSize = screenWidth * 0.020; // For larger screens
  }

  return GoogleFonts.outfit(
    textStyle: TextStyle(
      letterSpacing: 0.5,
      fontSize: fontSize,
      color: colorgreydark, // Assuming colorgreydark is defined elsewhere
    ),
  );
}

final H3 = GoogleFonts.outfit(
  textStyle: TextStyle(
    letterSpacing: .5,
    fontSize: Get.width * .016,
    color: colorgreydark,
  ),
);
final detailBoxTextStyle = GoogleFonts.outfit(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 24,
    color: colorDarkSlateBlue,
  ),
);
final detailBoxTextStyleMobile = GoogleFonts.outfit(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 18,
    color: colorDarkSlateBlue,
  ),
);
final formHeaderTextStyleMobile = GoogleFonts.roboto(
  textStyle: const TextStyle(
    letterSpacing: 0.5,
    fontSize: 20,
    color: colorDarkBackground,
    // Use color value in hexadecimal format
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.5, // You can adjust the line height as needed
  ),
);
final bodyf = GoogleFonts.outfit(
  textStyle: const TextStyle(
    letterSpacing: .5,
    fontSize: 14,
    color: colorlightgrey,
  ),
);

TextStyle bodyBlack(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize;
// Define font sizes based on screen width
  if (screenWidth < 600) {
    fontSize = screenWidth * 0.056; // For smaller screens like mobile
  } else {
    fontSize = screenWidth * 0.01; // For larger screens
  }

  return GoogleFonts.outfit(
    textStyle: TextStyle(
      letterSpacing: .5,
      fontSize: fontSize,
      color: colorblack,
    ),
  );
}

final iconText = GoogleFonts.roboto(
  fontSize: 14,
  color: colorgreydark,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);
final iconText2 = GoogleFonts.roboto(
  fontSize: 12,
  color: Colors.grey,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

final ratingStyle = GoogleFonts.outfit(
  textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Get.width * 0.015,
      height: 1.26,
      color: colorgreydark.withOpacity(0.4)),
);
final GradientStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 28,
));

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
//const colorwhite = Color(0xFFEEEEEE);
const colorgreen = Color(0xff088943);
const colorTextgrey = Color(0xff808080);
const colorwhite = Color(0xFFffffff);
const colorblack = Color(0xFF111B19);
const colorDarkblack = Color(0xFF000000);
const colorgreydark = Color(0XFF444444);
const colorblue = Color(0XFF2659C3);
const colorgreenishblack = Color(0xff112211);
const colorDarkBlue = Color(0xff141A2F);
const colorLightBrown = Color(0xFFCC7E63);
const colorDarkSlateBlue = Color(0xFF1C2B38);
const colorDarkBackground = Color(0xFF1C1C1C);
const colorMediumBlue = Color(0xff2659C3);

// others
const String baseurl = "http://69.48.163.45/api";
//const String baseurl = "http://localhost:3000";
//const String baseurl = "http://localhost:3000";

class images {
  static const String paymentsucess =
      ".././assets/asset/images/successmobile.png";
  static const String paymentsucessdesktop =
      ".././assets/asset/images/success.png";
  static const String logo = ".././assets/asset/images/logo.png";
  static const String logowhite = ".././assets/asset/images/whitelogo.png";
  static const String paymentsimage =
      ".././assets/asset/images/footerimage.png";
  static const String bannerimage = ".././assets/asset/images/Bannerimage.jpg";
  static const String iphone = ".././assets/asset/images/Iphone.png";
  static const String signinmobile =
      ".././assets/asset/images/signupmobile.png";
  static const String signin = ".././assets/asset/images/Iphone.png";
  static const String signupmobile = ".././assets/asset/images/Iphone.png";
  static const String signup = ".././assets/asset/images/signup_side_image.png";
  static const String exclamination =
      ".././assets/asset/images/exclamation.png";
  static const String paymentfailure =
      ".././assets/asset/images/failureimg.png";
  static const String paymentfailuremobile =
      ".././assets/asset/images/failedmobile.png";
  static const String notfound = ".././assets/asset/images/404.png";
  static const String notfoundmobile = ".././assets/asset/images/404mobile.png";
  static const String slider1 = "/public/uploads/1.jpg";
  static const String slider2 = "/public/uploads/2.jpg";
  static const String slider3 = "/public/uploads/3.webp";
  static const String slider4 = "/public/uploads/4.jpg";
  static const String slider5 = "/public/uploads/5.WEBP";
  static const String slider6 = "/public/uploads/6.png";
  static const String slider7 = "/public/uploads/7.jpg";
}
