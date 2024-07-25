import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../eventdetails_Controller.dart';

Widget ArtistColumn(BuildContext context,
    EventdetailsController eventController) {
  return Flexible(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(right: 80 ,),
      child: Container(
          constraints: BoxConstraints(
            minHeight: 300.0, // Set the minimum height
          ),
        padding: EdgeInsets.symmetric(vertical: 20),

        decoration: BoxDecoration(
          color: colorwhite,
          borderRadius: BorderRadius.circular(20)
        ),
          width: double.infinity,
          child: Column(children: [


            Obx(() {
              return CircleAvatar(
                backgroundColor: colorMediumBlue,
                radius: 60,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      eventController.eventdetails.value?.artistimage ?? ""),
                ),
              );
            }),
            Obx(() {
              return Text(
                "${eventController.eventdetails.value?.artistname ??
                    'Loading...'}",
                style: getH2TextStyle(context).copyWith(color: Colors.black),
              );
            }),
            Obx(() {
              return Text(
                "${eventController.eventdetails.value?.moreinfo ??
                    'Loading...'}",
                style: bodyf.copyWith(color: Colors.black),
              );
            }),

          ],)
      ),
    ),
  );
}