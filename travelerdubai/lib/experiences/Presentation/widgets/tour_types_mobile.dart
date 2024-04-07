import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';

class TourTypesMobile extends StatelessWidget {

  const TourTypesMobile( {super.key});
  @override
  Widget build(BuildContext context) {
    ExperienceController experienceController = Get.find();
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundgradient,
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),


          Padding(
    padding: EdgeInsets.symmetric(
    horizontal: Get.width * 0.03,),
            child: RichText(
              text: TextSpan(
                style:  TextStyle(
                  fontSize: Get.width*0.05,
                  fontWeight: FontWeight.bold,
                ),
                children: [

                  TextSpan(
                    text: 'Browse By Themes  ',
                    style: TextStyle(
                      foreground: Paint()
                        ..shader =  const LinearGradient(
                          colors: [
                            colorHighlights,
                            colorPrimary
                          ], // Define your gradient colors
                        ).createShader(const Rect.fromLTWH(50.0, 20.0, 90.0,
                            20.0)), // Adjust the size as needed
                    ),
                  ),


                ],
              ),
            ),
          ),
          Expanded(child: Container()),

          Container(
            height: 50,
            child: Obx(() {
              if (experienceController.tourTypes.isEmpty) {
                return const Center(child: Text('Empty'));
              } else {
                return ListView(
                  scrollDirection: Axis.horizontal,

                  children: List.generate(
                    experienceController.tourTypes.length,
                        (index) {
                      String cityTourType =
                      experienceController.tourTypes[index]['cityTourType'];
                      return InkWell(
                        onTap: () {
                          experienceController
                              .filterCityToursByType(cityTourType);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02,
                             ),
                          child: Container(

                            width: Get.width*0.4,
                            decoration: BoxDecoration(
                              color: colorwhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: colorlightgrey.withOpacity(0.2),
                                // Set the color of the border
                                width: 2.0, // Set the width of the border
                              ),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width * 0.009),
                                    child: Text(
                                      cityTourType,
                                      textAlign: TextAlign.center,
                                      style: bodygrey(Get.context!),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ),
          Expanded(child: Container()),

        ],
      ),
    );
  }


}


