import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/service/auth.dart';
import 'package:travelerdubai/homepage/presentaion/home_page_mobile.dart';
import 'package:travelerdubai/homepage/presentaion/homepage.dart';

import '../Components/floatingaction_button.dart';
import 'constants/constants.dart';
import 'controller/headercontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HeaderController headerController = Get.find();
    Get.put(AuthClass());
    return Scaffold(
      floatingActionButton:
     FloatingCartButton(),

      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Homepage();
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return HomePageMobile();
          } else {
            return HomePageMobile();
          }
        },
      ),
    );
  }
}
