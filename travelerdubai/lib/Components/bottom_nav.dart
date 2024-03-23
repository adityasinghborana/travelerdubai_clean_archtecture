import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';

import '../auth/presentation/screens/signup.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      color: colorwhite,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(

            icon: Icon(Icons.house,size: 24, ),
            onPressed: () {
              // Navigate to home page
              Get.toNamed("/home");
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.faceSmile,size: 24),
            onPressed: () {
              // Navigate to home page
              Get.toNamed('experiences');
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.calendarDay,size: 24),
            onPressed: () {
              // Navigate to home page

                  Get.toNamed('events');

            },
          ),
          IconButton(
            icon: Icon(Icons.person,size: 24),
            onPressed: () {
              Get.toNamed('Login');
            },
          ),
        ],
      ),
    );
  }
}
