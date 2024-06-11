import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

class HeroImageWidget extends StatelessWidget {
  final double titleFontSize;

  const HeroImageWidget({super.key, required this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return
       Obx(() {
        final imageUrl = controller.imageList.isNotEmpty
            ? controller.imageList[
                controller.currentIndex.value % controller.imageList.length]
            : 'assets/background.png';
        if (kDebugMode) {
          print(imageUrl);
        }

        return AuraUICarousel(
padding: EdgeInsets.zero,
          borderRadius: 16,
          images: controller.imageList,
          pageController: controller.pageController,
          curve: Curves.easeInOutCubicEmphasized,
          showButtons: false,
          indicatorType: CarouselIndicatorType.dot,
          duration: const Duration(seconds: 4),
          height: Get.height*0.72,
          maxWidth: double.infinity,
        );
      });
  }
}
