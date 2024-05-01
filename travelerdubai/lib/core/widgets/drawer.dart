import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';

import '../homescreen.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Image.asset("/assets/images/logo.png"),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            // Navigate to page when item is clicked
            Get.to(const HomeScreen());
          },
        ),
        ListTile(
          title: const Text('Experiences'),
          onTap: () {
            // Navigate to another page when item is clicked
            Get.to(Experiences());
          },
        ),
        // ListTile(
        //   title: Text('Contact Us'),
        //   onTap: () {
        //     Get.to(Contactus());
        //   },
        // ),
        ListTile(
          title: const Text('Cart'),
          onTap: () {
            Get.toNamed("/checkout");
          },
        ),
        ListTile(
          title: const Text('Dashboard'),
          onTap: () {
            Get.toNamed("/dashboardpage");
          },
        ),
      ],
    ),
  );
}
