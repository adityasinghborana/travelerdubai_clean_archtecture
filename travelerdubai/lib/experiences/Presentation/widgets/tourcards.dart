import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';

import '../../../tourdetails/presentation/Widgets/html.dart';

Widget tourcards() {
  final ExperienceController experienceController = Get.find();

  return Obx(() {
    if (experienceController.cityTours.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      List<Experiences> displayedTours =
          experienceController.selectedTourType.isEmpty
              ? experienceController.cityTours
              : experienceController.cityTours
                  .where((tour) =>
                      tour.cityTourType ==
                      experienceController.selectedTourType.value)
                  .toList();

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns as needed
            crossAxisSpacing: 8, // Adjust the horizontal spacing between items
            mainAxisSpacing: 50, // Adjust the vertical spacing between items
          ),
          itemCount: displayedTours.length,
          itemBuilder: (context, index) {
            final tour = displayedTours[index];
            final tourdetailid = tour.tourdetails?[0].id;

            return InkWell(
              onTap: () => Get.toNamed(
                '/tour_details',
                arguments:
                  "$tourdetailid",

              ),
              child: Card(
                color: colorwhite,
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                        height: Get.height / 5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tour.tourName,
                            style: H3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Tour Type - ${tour.cityTourType}",
                            style: bodyf,
                          ),
                          Text(
                            "City - ${tour.cityName}",
                            style: bodyf,
                          ),
                          const SizedBox(height: 8),
                          HtmlDisplayWidget(htmlContent: '${tour.tourShortDescription}',),
                          // Text(
                          //   tour.tourShortDescription,
                          //   overflow: TextOverflow.ellipsis,
                          //   maxLines: 2,
                          //   style: bodyblack,
                          // ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Rating: ${tour.rating}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: bodyblack,
                              ),
                              const SizedBox(width: 5),
                              Row(
                                children: List.generate(
                                  tour.rating,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: colorPrimary,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  });
}
