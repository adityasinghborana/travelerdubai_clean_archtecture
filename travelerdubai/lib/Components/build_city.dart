import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/presentaion/widgets/cities.dart';
import 'buid_heading.dart';

Widget buildCitySection(
    String heading, ScrollController? controller, double? width) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: Get.height * .076),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(heading),
            Container(
                height: Get.height * .3,
                width: Get.width,
                child: CityList(Controller: controller!)),
            const SizedBox(height: 40),
          ],
        ),
      ],
    ),
  );
}
