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
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 3, // Adjust the number of columns as needed
            crossAxisSpacing: 40, // Adjust the horizontal spacing between items
            mainAxisSpacing: 40, // Adjust the vertical spacing between items
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
              child:Card(
                color: colorwhite,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: AspectRatio(
                          aspectRatio:1 / 0.6, // Set the aspect ratio as needed
                          child: Image.network(
                            "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                        tour.tourName.length <= 20
                        ? tour.tourName
                            : tour.tourName.substring(0, 20) +
                            '...',
                                    style: TextStyle(fontSize: 26),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),

                                Row(
                                  children: [
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            HtmlDisplayWidget(

                              htmlContent: tour.tourShortDescription.length <= 80
                                  ? tour.tourShortDescription
                                  : tour.tourShortDescription.substring(0, 80) +
                                      '...',
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
