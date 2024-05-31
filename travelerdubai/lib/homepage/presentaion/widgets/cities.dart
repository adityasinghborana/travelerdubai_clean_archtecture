import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/homepage/cities_controller.dart';

import '../../../core/constants/constants.dart';
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
    final ScrollController listController = ScrollController();
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double widthFactor;
      // Determine width factor based on screen size
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        widthFactor =
            MediaQuery.of(context).size.height * .50; // Adjust for desktop
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        widthFactor =
            MediaQuery.of(context).size.height * .30; // Adjust for tablet
      } else {
        widthFactor =
            MediaQuery.of(context).size.height * .30; // Adjust for mobile
      }
      return Obx(() {
        if (controller.cities.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SizedBox(
            width: Get.width * .9,
            height: Get.height * .6,
            child: ListView.builder(
              controller: listController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.cities.length,
              itemBuilder: (context, index) {
                final city = controller.cities[index];
                return InkWell(
                  onTap: () {
                    String cityName = city.CityName;

                    Get.toNamed(
                      '/experiences',
                      parameters: {'cityName': cityName.toString()},
                    );
                  },
                  child: SizedBox(
                    width: Get.width * .18,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              "https://source.unsplash.com/random/?${city.CityName}",
                              fit: BoxFit.cover,
                              height: Get.height * 0.6,
                              width: Get.width * .18,

                              // width: Get.width * 0.18
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: imageGradient,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: widthFactor,
                                child: Text(
                                  city.CityName,
                                  style: getH2TextStyle(context)
                                      .copyWith(color: colorwhite),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
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
    });
  }
}
