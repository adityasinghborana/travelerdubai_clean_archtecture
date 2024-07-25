import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../eventdetails_Controller.dart';

Widget Heading(
    BuildContext context, EventdetailsController eventController) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          return Text(
            "${eventController.eventdetails.value?.eventName ?? 'Loading...'}",
            style: getH2TextStyle(context).copyWith(color: Colors.black),
          );
          // Ensure the text updates when eventdetails changes
        }),

        Obx(() {
          return Text(
            "Date ${eventController.eventdetails.value?.date.toString().substring(0, 10) ?? 'Loading...'}",
            style: getH2TextStyle(context).copyWith(color: Colors.black),
          );
        }),
      ],
    ),
  );
}