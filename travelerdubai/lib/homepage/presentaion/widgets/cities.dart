import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/homepage/cities_controller.dart';

class CityList extends StatelessWidget {
  final CityController controller = Get.put(CityController());
  final ScrollController scrollController = ScrollController();

  CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cities.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          itemCount: controller.cities.length,
          itemBuilder: (context, index) {
            final city = controller.cities[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      "https://source.unsplash.com/random/?${city['CityName']}",
                      width: Get.width / 5,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text("${city['CityName']}",style: H3,),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }
}
