import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget advertisement({required double subHeadingfontsize, required double Headingfontsize}) {


  return Container(
    height: Get.height * .80,
    width: Get.width,
    decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xffd1d5ff),
        Color(0xfff3c5f1),
      ], stops: [
        0.0,
        1.0
      ]),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                'Your all-in-one travel app.',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: Headingfontsize,
                  height: 1.25,
                ),
              ),
              SizedBox(
                width: Get.width * .50,
                child: SelectableText(
                  'Book flights, hotels, trains & rental cars'
                  ' anywhere in the world in just seconds.'
                  ' Get real-time flight updates, travel info,'
                  ' exclusive deals, and 30% more Trip Coins only on the app!',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w400,
                    fontSize: subHeadingfontsize,
                    height: 1.25,
                  ),
                  maxLines: 4,
                ),
              ),
            ],
          ),
          SizedBox(
            width: Get.width * .10,
          ),
          Image.asset(
            "../assets/assets/images/Iphone.png",
            width: Get.width * .155,
            height: Get.height * .60,
          ),
        ],
      ),
    ),
  );
}
