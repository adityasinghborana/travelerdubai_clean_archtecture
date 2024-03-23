import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/homepage/cities_controller.dart';

import '../../remote/homepage_remote_service.dart';
import '../../repository/homepage_repository.dart';
import '../../usecase/cities_usecase.dart';

class CityList extends StatelessWidget {
  final CityController controller = Get.put(CityController(
      GetCitiesUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final ScrollController scrollController = ScrollController();

  CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cities.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Container(
          width: Get.width * .8,
          height: Get.height * .5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            itemCount: controller.cities.length,
            itemBuilder: (context, index) {
              final city = controller.cities[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      "https://source.unsplash.com/random/?${city.CityName}",
                height: Get.height*0.3,
                      fit: BoxFit.cover,
                      width: Get.width *0.25,

                    ),
                    Container(
                      decoration: BoxDecoration(gradient: imageGradient),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "${city.CityName}",
                        style: H3,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    });
  }
}
