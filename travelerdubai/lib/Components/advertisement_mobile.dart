import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget advertisementMobile({required double subHeadingfontsize, required double Headingfontsize}) {


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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              SizedBox(
                width: Get.width ,

                child:  SelectableText(
                  'Your all-in-one travel app.',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: Headingfontsize,
                    height: 1.25,
                  ),
                ),

                ),

              Image.asset(
                "../assets/Iphone.png",
                width: Get.width ,
                height: Get.height * .3,
              ),
            ],

          ),

        ],
      ),
    ),
  );
}
