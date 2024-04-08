import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/experiences/Presentation/experiences.dart';


import '../../contactus/presentation/Contactus.dart';
import '../homescreen.dart';

Widget drawer (){

  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.all(8),
      children: [
        Image.asset("/assets/assets/images/logo.png"),
        ListTile(
          title: Text('Home'),
          onTap: () {
            // Navigate to page when item is clicked
            Get.to(HomeScreen());
          },
        ),
        ListTile(
          title: Text('Experiences'),
          onTap: () {
            // Navigate to another page when item is clicked
            Get.to(Experiences());
          },
        ),
        ListTile(
          title: Text('Contact Us'),
          onTap: () {
            Get.to(Contactus());
          },
        ),
      ],
    ),
  );
}