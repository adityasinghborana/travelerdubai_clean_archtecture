import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/homepage/presentaion/homepage.dart';

class Homescreen extends StatelessWidget {
  final ScrollController _pagecontroller = ScrollController();

  Homescreen({super.key});

  @override
  Widget build(BuildContext Context) {
    Get.put(AuthClass());
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Homepage(),
        ],
      ),
    );
  }
}
