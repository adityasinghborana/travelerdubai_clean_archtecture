import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourcards.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourtypes.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/remote/experiences_remote_service.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';

import '../../core/widgets/header.dart';

class experiences extends StatelessWidget {
  final ExperienceController experienceController = Get.put(
      ExperienceController(GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));
  TextEditingController searchController = TextEditingController();

  experiences({super.key});

  @override
  Widget build(BuildContext Context) {
    String currentDate = DateTime.now().toString().split(' ')[0];
    return Scaffold(

      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Tourtypes(),
          ),
          Flexible(
              flex: 4,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height * 0.3,
                        child: Image.network(
                          "https://source.unsplash.com/random",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top:
                            20, // Adjust the vertical position of the text field
                        left:
                            20, // Adjust the horizontal position of the text field
                        right: 20, // Adjust the width of the text field
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(
                                  width:
                                      10), // Add space between icon and text field
                              Expanded(
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
                      ),
                      Positioned(
                        top: Get.height / 10,
                        left: Get.width / 6,
                        child: Text("Discover All Experiences", style: H1),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.7, child: tourcards()),
                ],
              )),
        ],
      ),
    );
  }
}
