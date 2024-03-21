import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

class HeroImageWidget extends StatelessWidget {
  final double titlefontsize ;
  final HomeController controller = Get.find();

  HeroImageWidget({super.key, required  this.titlefontsize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final imageUrl = controller.imageList.isNotEmpty
            ? controller.imageList[
                controller.currentIndex.value % controller.imageList.length]
            : 'assets/background.png';
        if (kDebugMode) {
          print(imageUrl);
        }

        return Stack(
          children: [
            // Image.network(
            //   imageUrl,
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
            MUICarousel(
              images: controller.imageList,
              indicatorType: CarouselIndicatorType.dot,
              duration: const Duration(seconds: 2),
              height: double.infinity,
              maxWidth: double.infinity,
            ),
            // Container(
            //   width: double.infinity,
            //   height: double.infinity,
            //   color: const Color.fromRGBO(0, 0, 0, 0.5),
            // ),
            Positioned(
              top: Get.width * 0.15,
              left: Get.width * 0.15,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      controller.formData.value?.title ?? 'Traveller Dubai',
                      style: GoogleFonts.playfairDisplay(
                        color: colorPrimary,
                        fontSize: titlefontsize,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines:
                          1, // Specify the maximum number of lines to prevent scrolling
                    ),
                    SizedBox(
                      height: 60,
                      width: Get.width * .75,
                      child: SelectableText(
                        controller.formData.value?.title ??
                            'Search for help - Enter a question or keywords in the search box on the taskbar to find apps, files, settings, and get help from the web',
                        style: GoogleFonts.playfairDisplay(
                          color: colorwhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 4,
                      ),
                    ),
                    InlineFlexButton(
                        fontsize: 28,
                        vpadding: 20,
                        label: "Explore More",
                        onPressed: (() => Get.toNamed('/experiences')))
                  ],
                ),
              ),
            ),

          ],
        );
      }),
    );
  }



}
