import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/Components/drawer.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourcards.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';
import '../../Components/BannerSearchWidget.dart';
import '../../Components/Sidebar.dart';
import '../../Components/header.dart';
import '../model/experience_response_model.dart';

class ExperiencesDesktop extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  ExperiencesDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ExperienceController experienceController = Get.put(
      ExperienceController(
        GetExperiencesUseCase(
          ExperiencesRepositoryImpl(
            ExperienceRemoteService(Dio()),
          ),
        ),
      ),
    );

    String? city = Get
        .parameters['cityName']; // Retrieve city inside build method
    if (kDebugMode) {
      print('city is $city');
    }

    List<Experiences> allTours = experienceController.selectedTourType.isEmpty
        ? experienceController.cityTours
        : experienceController.cityTours
        .where((tour) =>
    tour.cityTourType == experienceController.selectedTourType.value)
        .toList();

    List<Experiences> filterCityTour = city != null
        ? experienceController.cityTours.where((tour) => tour.cityName == city)
        .toList()
        : []; // Handle null city

    var displayedTours = city != null ? filterCityTour : allTours;
    Get.lazyPut(() => HeaderController());

    return Scaffold(
      drawer: drawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Header(),
            HeaderSearchWidget(
              imageUrl: "https://d1i3enf1i5tb1f.cloudfront.net/Tour-Images/false-4710/emirates-zoo-img.jpg",
              title: "Discover All Experiences",
              searchController: experienceController.searchController,
              onSearch: (value) {
                experienceController.searchQuery.value  =value;
                experienceController.searchCityTours();
              },
            ),
            SizedBox(height: Get.height * .03),
            SizedBox(
              width: Get.width * 0.95,
              height: Get.height * .95,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Obx(() {
                      return TourTypes(
                        onTap: (String cityTourType) {
                          experienceController.filterCityToursByType(
                              cityTourType);
                        },
                        onDoubleTap: () {
                          experienceController.resetSelectedTourType();
                        },
                        title: 'Browse By Themes',
                        items: experienceController.tourTypes.map((e) =>
                            e['cityTourType'].toString()).toList(),
                      );
                    }),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Obx(()=>  experienceController.cityTours.isEmpty && experienceController.noTourFound.value
                          ? Center(child: Text('No Tours Found'))
                          : tourCardsMobile(displayedTours, city)),
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
