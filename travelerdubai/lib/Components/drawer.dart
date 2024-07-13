import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';

import '../contactus/presentation/contactusScreen.dart';
import '../core/homescreen.dart';

Widget drawer() {
  final HeaderController headerController = Get.find();
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(images.logo),
        ),
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
          Get.toNamed("/experiences");
          },
        ),
        ListTile(
          title: Text('Contact Us'),
          onTap: () {
            Get.to(Contactus());
          },
        ),
       headerController.loggedIn.isTrue ?  ListTile(
         title: const Text('Cart'),
         onTap: () {
           Get.toNamed("/checkout");
         },
       ):  ListTile(
         title: const Text('Login'),
         onTap: () {
           Get.toNamed("/login");
         },
       ),
        headerController.loggedIn.isTrue ?  ListTile(
  title: const Text('Dashboard'),
  onTap: () {
  Get.toNamed("/dashboardpage");
  },
  ):  ListTile(
         title: const Text('SignUp'),
         onTap: () {
           Get.toNamed("/SignupPage");
         },
       ),

      ],
    ),
  );
}
