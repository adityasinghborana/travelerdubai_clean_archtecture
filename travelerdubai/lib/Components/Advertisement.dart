import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/core/constants/constants.dart';

Widget advertisement(
    {required double subHeadingfontsize, required double Headingfontsize, required BoxDecoration decoration }) {
  return Container(
    height: Get.width > 600 ? Get.width * .5 : Get.height * 0.6,
    width: Get.width,
    decoration: decoration,
    child: Center(
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Get.width > 600 ? Axis.horizontal : Axis.vertical,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: Get.width > 600
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: Get.width > 600
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                SelectableText(
                  'Discover Dubai’s Wonders with Exclusive Tickets!',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: Headingfontsize,
                    height: 1.25,
                  ),
                ),
                Get.width > 600 ? SizedBox(
                  width: Get.width * .50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // RichText(
                      //   text: TextSpan(
                      //     style: GoogleFonts.outfit(
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 16, // Replace with your desired font size
                      //       height: 1.25,
                      //       color: Colors.black, // Set your desired text color here
                      //     ),
                      //     children: [
                      //       WidgetSpan(
                      //         child: Icon(Icons.star, color: Colors.yellow, size: 16),
                      //       ),
                      //       TextSpan(text: ' Unlock the Magic of Dubai!\n'),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children: [
                            // WidgetSpan(
                            //   child: Icon(Icons.star, color: Colors.yellow, size: 16),
                            // ),
                            TextSpan(text: 'Dive into a world of adventure and luxury with our unbeatable ticket offers to the city’s top attractions. Whether you’re a thrill-seeker, culture enthusiast, or family adventurer, Dubai has something spectacular for you!\n'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children: [
                            WidgetSpan(
                              child: Text('🎟️', style: TextStyle(fontSize: 16)),
                            ),
                            TextSpan(text: 'Book Now and Save Up to 30%:\n',style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(text: 'Limited time only—grab your tickets and enjoy exclusive discounts!\n'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children: [
                            WidgetSpan(
                              child: Text('🚀', style: TextStyle(fontSize: 16)),
                            ),
                            TextSpan(text: 'Skip-the-Line Access:\n',style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(text: 'Spend less time waiting and more time enjoying! Get fast-track entry to the city’s most popular spots.\n'),

                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children: [
                            WidgetSpan(
                              child: Text('🎉', style: TextStyle(fontSize: 16)),
                            ),
                            TextSpan(text: 'Exclusive Perks: \n',style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(text: 'Access special promotions and VIP experiences that are available only through our platform.\n'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.handshake), style: TextStyle(fontSize: 16,color: Colors.red),),

                            TextSpan(text: 'Local Insights: \n',style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(text: 'Local Insights: Benefit from insider tips and recommendations from our knowledgeable team to enhance your visit.\n'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            fontSize: 16, // Replace with your desired font size
                            height: 1.25,
                            color: Colors.black, // Set your desired text color here
                          ),
                          children:const  [
                          TextSpan(text: 'Ready for an unforgettable adventure? Click below to explore our full range of attractions and secure your tickets today!'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     Container(width: 150,

                         child:  ButtonView(btnName: "Explore Now",onButtonTap: (){
                           Get.toNamed('/experiences');
                         },),)
                    ],
                  ),

                ) : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            width: Get.width * .10,
          ),
          Flexible(
            flex: 1,
            child: Image.asset(
              images.iphone,
              width: Get.width > 600 ? Get.width * .155 : Get.width * 1,
              height: Get.width > 600 ? Get.height * .60 : Get.height * .4,
            ),
          ),
        ],
      ),
    ),
  );
}
