import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/presentaion/widgets/cities.dart';
import 'buid_heading.dart';

Widget buildCitySection(String heading, double? width) {
  final ScrollController  ss = ScrollController();
  return Container(

    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: buildHeading(heading),
            ),
            SizedBox(
                height: Get.height * .3, width: Get.width, child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CityList(),
                )),
            const SizedBox(height: 40),
          ],
        ),
      ],
    ),
  );
}
