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

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () => Get.toNamed(
                  '/tour_details',
                  parameters: {'tourId': tourDetailId.toString()},
                  // arguments: "$tourDetailId",
                ),
                child: Card(
                  color: colorwhite,
                  elevation: 3,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1/0.6,
                          child: Image.network(
                            "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",


                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                   // height: MediaQuery.of(context).size.height * 0.025,
                                    child: SingleChildScrollView(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(

                                            child: Text(
                                              tour.tourName.length <= 20
                                                  ? tour.tourName
                                                  : tour.tourName.substring(0, 20) +
                                                  '...',
                                              style: TextStyle(
                                                letterSpacing: .5,
                                                fontSize:MediaQuery.of(context).size.width*.016,
                                                color: colorgreydark,
                                              ),
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

                                  SizedBox(

                                    child: SingleChildScrollView(
                                      child: HtmlDisplayWidget(
                                        htmlContent: tour.tourShortDescription.length <= 80
                                            ? tour.tourShortDescription
                                            : tour.tourShortDescription.substring(0, 80) + '...',
                                      ),
                                    ),
                                  ),
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

Widget tourCardsMobile() {
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
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as needed
            crossAxisSpacing: 8, // Adjust the horizontal spacing between items
            mainAxisSpacing: 20, // Adjust the vertical spacing between items
          ),
          itemCount: displayedTours.length,
          itemBuilder: (context, index) {
            final tour = displayedTours[index];
            final tourDetailId = tour.tourdetails?[0].id;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Get.toNamed(
                  '/tour_details',
                  parameters: {'tourId': tourDetailId.toString()},
                  // arguments: "$tourDetailId",
                ),
                child: Card(
                  color: colorwhite,
                  elevation: 3,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1/0.6,
                          child: Image.network(
                            "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",


                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height * 0.025,
                                    child: SingleChildScrollView(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(

                                            child: Text(
                                              tour.tourName.length <= 20
                                                  ? tour.tourName
                                                  : tour.tourName.substring(0, 20) +
                                                  '...',
                                              style: TextStyle(
                                                letterSpacing: .5,
                                                fontSize:MediaQuery.of(context).size.width*.025,
                                                color: colorgreydark,
                                              ),
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
                                  SizedBox(height: 2,),
                                  SingleChildScrollView(
                                    child: HtmlDisplayWidget(
                                      htmlContent: tour.tourShortDescription.length <= 80
                                          ? tour.tourShortDescription
                                          : tour.tourShortDescription.substring(0, 80) + '...',
                                    ),
                                  ),
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
