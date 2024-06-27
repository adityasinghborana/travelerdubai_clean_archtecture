import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

Widget tourCards(List<Experiences> displayedTours, String? cityName,
    ScrollController? scrollController) {
  final ExperienceController experienceController = Get.find();
  final ScrollController controller = ScrollController();
  controller.addListener(() {
    scrollController?.jumpTo(scrollController.position.maxScrollExtent);
  });

  return Obx(() {
    if (experienceController.cityTours.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      List<Experiences> filteredTours = cityName != null
          ? displayedTours.where((tour) => tour.cityName == cityName).toList()
          : displayedTours;

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          controller: controller,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.2,
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemCount: filteredTours.length,
          itemBuilder: (context, index) {
            final tour = filteredTours[index];
            final tourDetailId = tour.tourdetails?.id;

            return InkWell(
              onTap: () => Get.toNamed(
                '/tour_details',
                parameters: {'tourId': tourDetailId.toString()},
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                      height: Get.height * 0.6,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(gradient: imageGradient),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          tour.tourName ??"Undefined",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
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

Widget tourCardsMobile(List<Experiences> displayedTours, String? cityName) {
  final crossAxisCount = Get.width < 600 ? 2 : 3;
  final ExperienceController experienceController = Get.find();

  return Obx(() {
    if (experienceController.cityTours.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      List<Experiences> filteredTours = cityName != null
          ? displayedTours.where((tour) => tour.cityName == cityName).toList()
          : displayedTours;

      return Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.1,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemCount: filteredTours.length,
          itemBuilder: (context, index) {
            final tour = filteredTours[index];
            final tourDetailId = tour.tourdetails?.id;

            return InkWell(
              onTap: () => Get.toNamed(
                '/tour_details',
                parameters: {'tourId': tourDetailId.toString()},
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(gradient: imageGradient),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          tour.tourName ??"Undefined",
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
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
