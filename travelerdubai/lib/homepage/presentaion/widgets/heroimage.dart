import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

class HeroImageWidget extends StatelessWidget {
  final double titlefontsize;

  HeroImageWidget({super.key, required this.titlefontsize});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
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
            // MUICarousel(
            //   showButtons: false,
            //   images: controller.imageList,
            //   // indicatorType: CarouselIndicatorType.dot,
            //   // duration: const Duration(seconds: 2),
            //   height: double.infinity,
            //   maxWidth: double.infinity,
            // ),
            // MUICarousel(
            //   images: imageUrls,
            //   maxWidth: double.infinity,
            //   height: MediaQuery.of(context).size.height * 0.5,
            //   showButtons: false,
            // ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
                child: Container(
                  height: Get.height * .80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        controller.formData.value?.title ?? 'Traveller Dubai',
                        style: GoogleFonts.outfit(
                          color: colorwhite,
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
                          style: GoogleFonts.roboto(
                            color: colorwhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 4,
                        ),
                      ),
                      InlineFlexButton(
                          bgcolor: colorblue,
                          fontsize: 28,
                          vpadding: 20,
                          label: "Explore More",
                          onPressed: (() => Get.toNamed('/experiences')))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
