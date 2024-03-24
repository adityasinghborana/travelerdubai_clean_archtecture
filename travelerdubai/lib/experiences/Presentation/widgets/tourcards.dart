import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

import '../../../tourdetails/presentation/Widgets/html.dart';

Widget tourCards() {
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
            final tourDetailId = tour.tourdetails?[0].id;

            return InkWell(
              onTap: () => Get.toNamed(
                '/tour_details',
                parameters: {'tourId': tourDetailId.toString()},
                // arguments: "$tourDetailId",
              ),
              child: Card(
                color: colorwhite,
                elevation: 3,
                child: SizedBox(
                  height: Get.height * .25,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                          height: Get.height * .35,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.width * 0.025,
                                    child: SingleChildScrollView(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              tour.tourName,
                                              style: H3,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(children: [
                                            Text(
                                              ' ${tour.rating}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: ratingStyle,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  HtmlDisplayWidget(
                                    htmlContent: tour.tourShortDescription,
                                  ),
                                  // Text(
                                  //   tour.tourShortDescription,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   maxLines: 2,
                                  //   style: bodyblack,
                                  // ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ],
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
  });
}
