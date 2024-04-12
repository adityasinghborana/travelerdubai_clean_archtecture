import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget advertisement({required double subHeadingfontsize, required double Headingfontsize , required BoxDecoration decoration }) {


  return Container(
    height: Get.width>600 ? Get.width * .5 : Get.height*0.6,
    width: Get.width,
    decoration:  decoration,
    child: Center(
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Get.width>600? Axis.horizontal:Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: Get.width>600 ?MainAxisAlignment.center:MainAxisAlignment.start,
            crossAxisAlignment: Get.width>600 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              SelectableText(
                'Your all-in-one travel app.',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: Headingfontsize,
                  height: 1.25,
                ),
              ),
             Get.width>600 ? SizedBox(
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
             ):SizedBox(),
            ],
          ),
          SizedBox(
            width: Get.width * .10,
          ),
          Image.asset(
            "../assets/images/Iphone.png",
            width: Get.width>600 ? Get.width * .155 : Get.width * 1,
            height: Get.width>600 ? Get.height * .60 : Get.height*.4,
          ),
        ],
      ),
    ),
  );
}
