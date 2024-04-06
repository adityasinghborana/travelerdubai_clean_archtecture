import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';

class Tourtypes extends StatelessWidget {
  final VoidCallback onTapAll;
   Tourtypes(this.onTapAll);
  @override
  Widget build(BuildContext context) {
    ExperienceController experienceController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Browse By Themes",
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w600, height: 1.172),
              ),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [

                    TextSpan(
                      text: 'Tours ',
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              colorHighlights,
                              colorPrimary
                            ], // Define your gradient colors
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 60.0,
                              20.0)), // Adjust the size as needed
                      ),
                    ),

                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: onTapAll,
                  child: Text(
                    "All",
                    style: bodyblack(Get.context!),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (experienceController.tourTypes.isEmpty) {
                    return const Center(child: Text('Empty'));
                  } else {
                    return ListView(

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
                                  horizontal: Get.width * 0.011,
                                  vertical: Get.height * 0.01),
                              child: Card(
                                surfaceTintColor: colorwhite,
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: colorlightgrey.withOpacity(0.2),
                                      // Set the color of the border
                                      width: 2.0, // Set the width of the border
                                    ),
                                  ),
                                  height: Get.height * 0.05,
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
                                            style: bodyblack(Get.context!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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

            ],
          ),
        ),
      ),
    );
  }


}


