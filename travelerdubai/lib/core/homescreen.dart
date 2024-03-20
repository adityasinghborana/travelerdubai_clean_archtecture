import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/homepage/presentaion/homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthClass());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Homepage(),
      ),
    );
  }
}
