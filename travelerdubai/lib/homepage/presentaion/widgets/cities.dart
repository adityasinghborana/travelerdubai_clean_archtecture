import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/homepage/cities_controller.dart';

import '../../remote/homepage_remote_service.dart';
import '../../repository/homepage_repository.dart';
import '../../usecase/cities_usecase.dart';

class CityList extends StatelessWidget {
  final CityController controller = Get.put(
    CityController(
      GetCitiesUseCase(
        HomeRepositoryImpl(
          HomeRemoteService(
            Dio(),
          ),
        ),
      ),
    ),
  );

  CityList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cities.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SizedBox(
          width: Get.width * .9,
          height: Get.height * .5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.cities.length,
            itemBuilder: (context, index) {
              final city = controller.cities[index];
              return InkWell(
                onTap: () {
                  String CityName = city.CityName;

                  Get.toNamed(
                    '/experiences',
                    parameters: {'cityName': CityName.toString()},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 9,
                          child: Image.network(
                            "https://source.unsplash.com/random/?${city.CityName}",
                            fit: BoxFit.cover,

                            // width: Get.width * 0.18
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(gradient: imageGradient),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(city.CityName,
                                style: getH2TextStyle(context)
                                    .copyWith(color: colorwhite)),
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
}
