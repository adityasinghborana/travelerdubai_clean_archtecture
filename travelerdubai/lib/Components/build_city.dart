import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/presentaion/widgets/cities.dart';
import 'buid_heading.dart';

Widget buildCitySection(String heading, double? width) {
  final ScrollController  ss = ScrollController();
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
            SizedBox(
                height: Get.height * .3, width: Get.width, child: CityList(listController:ss ,)),
            const SizedBox(height: 40),
          ],
        ),
      ],
    ),
  );
}
