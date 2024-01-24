import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';

Widget Tourtypes( ) {
  ExperienceController experienceController = Get.find();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: colorwhite,
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
            Container(
              child: Text(
                "Filters",
                style: H3,
              ),
            ),
            InkWell(
              onTap:(){

              },
              child: Container(
                child: InkWell(
                  onTap: () {
                    print("all");
                  },
                  child: Text(
                    "All",
                    style: bodyblack,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (experienceController.tourTypes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: experienceController.tourTypes.length,
                    itemBuilder: (context, index) {
                      String cityTourType =
                          experienceController.tourTypes[index]['cityTourType'];
                      return InkWell(
                        onTap: () {
                          experienceController
                              .filterCityToursByType(cityTourType);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cityTourType,
                            style: bodyblack,
                          ),
                        ),
                      );
                    },
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
