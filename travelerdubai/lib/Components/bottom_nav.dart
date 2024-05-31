import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: colorwhite,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.house,
              size: 24,
            ),
            onPressed: () {
              // Navigate to home page
              Get.toNamed("/home");
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.faceSmile, size: 20),
            onPressed: () {
              // Navigate to home page
              Get.toNamed('/experiences');
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.calendarDay, size: 20),
            onPressed: () {
              // Navigate to home page

              Get.toNamed('/experiences');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, size: 24),
            onPressed: () {
              Get.toNamed('/Login');
            },
          ),
        ],
      ),
    );
  }
}
