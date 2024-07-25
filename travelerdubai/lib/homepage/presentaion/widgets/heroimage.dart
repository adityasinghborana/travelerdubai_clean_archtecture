import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';


class HeroImageWidget extends StatelessWidget {
  final double titleFontSize;

  const HeroImageWidget({super.key, required this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();


    return AuraUICarouselTappable(

      padding: EdgeInsets.zero,
      borderRadius: 16,
      pageController: controller.pageController,
      curve: Curves.linear,
      showButtons: false,
      indicatorType: CarouselIndicatorType.dot,
      duration: const Duration(seconds: 4),
      height: Get.height * 0.72,
      maxWidth: double.infinity, items: controller.imageList,
    );
  }
}
