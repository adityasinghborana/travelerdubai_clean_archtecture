import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/homepage/presentaion/home_page_mobile.dart';
import 'package:travelerdubai/homepage/presentaion/homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthClass());
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Homepage();
          }


          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return HomePageMobile();
          } else {
            return Homepage();
          }
        },
      ),
    );
  }
}