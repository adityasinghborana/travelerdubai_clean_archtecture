import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/widgets/Mobileheader.dart';
import 'package:travelerdubai/core/widgets/drawer.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tour_types_mobile.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourcards.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';

import '../model/experience_response_model.dart';

class ExperiencesMobile extends StatelessWidget {
  final ExperienceController experienceController = Get.put(
    ExperienceController(
      GetExperiencesUseCase(
        ExperiencesRepositoryImpl(
          ExperienceRemoteService(Dio()),
        ),
      ),
    ),
  );

  final TextEditingController searchController = TextEditingController();

  ExperiencesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HeaderController());

    String? city =
        Get.parameters['cityName']; // Retrieve city inside build method
    print(city);

    List<Experiences> allTours = experienceController.selectedTourType.isEmpty
        ? experienceController.cityTours
        : experienceController.cityTours
            .where((tour) =>
                tour.cityTourType ==
                experienceController.selectedTourType.value)
            .toList();

    List<Experiences> filterCityTour = city != null
        ? experienceController.cityTours
            .where((tour) => tour.cityName == city)
            .toList()
        : []; // Handle null city

    var displayedTours = city != null ? filterCityTour : allTours;

    Get.lazyPut(() => HeaderController());

    String currentDate = DateTime.now().toString().split(' ')[0];

    return Scaffold(
        appBar: MobileHeader(
          context: context,
        ),
        drawer: drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.2,
              child: Stack(
                children: [
                  Image.network(
                    "https://source.unsplash.com/random",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text("Discover All Experiences",
                                      style: H1(context))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          width: Get.width * 0.8,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: colorwhite,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(width: 10),
                              Flexible(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    experienceController.searchCityTours(value);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: Get.height * .20,
              child: TourTypesMobile(),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: tourCardsMobile(displayedTours, city),
            ),
          ],
        ));
  }
}
