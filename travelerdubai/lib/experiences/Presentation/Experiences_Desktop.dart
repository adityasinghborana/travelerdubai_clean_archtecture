import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/widgets/drawer.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourcards.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourtypes.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';

import '../../core/widgets/header.dart';
import '../model/experience_response_model.dart';

class ExperiencesDesktop extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  ExperiencesDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController= ScrollController();
    final ExperienceController experienceController = Get.put(
      ExperienceController(
        GetExperiencesUseCase(
          ExperiencesRepositoryImpl(
            ExperienceRemoteService(Dio()),
          ),
        ),
      ),
    );

    String? city =
        Get.parameters['cityName']; // Retrieve city inside build method
    if (kDebugMode) {
      print('city is $city');
    }

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






    return Scaffold(
      drawer: drawer(),
      body: SingleChildScrollView(
        controller:scrollController ,
        child: Column(
          children: [
            Header(),
            Container(
              height: Get.height * 0.25,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height * 0.25,
                        child: Image.network(
                          "https://source.unsplash.com/random",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Text("Discover All Experiences",
                                  style: H1(context)),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.search),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: (value) {
                                          experienceController
                                              .searchCityTours(value);
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * .03),
            SizedBox(
              width: Get.width * 0.95,
              height: Get.height * .95,
              child: Row(
                children: [
                  const Flexible(
                    flex: 1,
                    child: Tourtypes(),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: tourCards(displayedTours, city),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
