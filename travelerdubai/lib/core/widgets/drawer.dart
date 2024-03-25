import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../contactus/presentation/Contactus.dart';
import '../homescreen.dart';

Widget drawer (){

  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.all(8),
      children: [
        Image.asset("./assets/logo.png"),
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
            Get.to(Contactus());
          },
        ),
        ListTile(
          title: Text('Account'),
          onTap: () {
            // Navigate to another page when item is clicked
            Get.to(Contactus());
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