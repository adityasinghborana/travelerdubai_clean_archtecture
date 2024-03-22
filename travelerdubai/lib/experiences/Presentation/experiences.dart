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

class Experiences extends StatelessWidget {
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

  Experiences({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateTime.now().toString().split(' ')[0];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              width: Get.width,
              height: Get.height * .75,
              child: Row(
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
                              height: Get.height * 0.30,
                              child: Image.network(
                                "https://source.unsplash.com/random",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              right: 20,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
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
                            ),
                            Positioned(
                              top: Get.height / 10,
                              left: Get.width / 6,
                              child:
                                  Text("Discover All Experiences", style: H1),
                            ),
                          ],
                        ),
                        Expanded(
                          child: tourcards(),
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
    );
  }
}
