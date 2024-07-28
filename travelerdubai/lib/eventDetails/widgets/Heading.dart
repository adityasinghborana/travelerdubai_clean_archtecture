import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../eventdetails_Controller.dart';

Widget Heading(BuildContext context, EventdetailsController eventController) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(() {
                return Text(
                  "${eventController.eventdetails.value?.eventName ?? 'Loading...'}",
                  style: getH2TextStyle(context).copyWith(color: Colors.black),
                  overflow: TextOverflow.visible, // Ensure long text is handled properly
                );
              }),
            ),
            SizedBox(width: 8), // Add some spacing between the text widgets
            Expanded(
              child: Obx(() {
                return Text(
                  "Date ${eventController.eventdetails.value?.date?.toString().substring(0, 10) ?? 'Loading...'}",
                  style: getH2TextStyle(context).copyWith(color: Colors.black),
                  textAlign: TextAlign.right, // Align text to the right
                 // Ensure long text is handled properly
                );
              }),
            ),
          ],
        ),
      ],
    ),
  );
}
