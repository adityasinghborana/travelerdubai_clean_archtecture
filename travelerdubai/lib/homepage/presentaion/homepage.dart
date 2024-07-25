import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/footer.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/cities.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/heroimage.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/tourscard.dart';
import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';
import '../../Components/header.dart';
import '../../Components/marquee.dart';
import '../../experiences/Presentation/experiences_controller.dart';
import '../../experiences/remote/experiences_remote_service.dart';

class Homepage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final TourlistController tourListController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController1 = ScrollController();
    final ScrollController scrollController2 = ScrollController();
    final ScrollController scrollController3 = ScrollController();
    final ScrollController scrollController4 = ScrollController();
    final ScrollController scrollController5 = ScrollController();
    final ScrollController scrollController6 = ScrollController();

    Get.put(
      ExperienceController(
        GetExperiencesUseCase(
          ExperiencesRepositoryImpl(
            ExperienceRemoteService(Dio()),
          ),
        ),
      ),
    );

    double? width = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(children: [
      SingleChildScrollView(
        controller: scrollController4,
        child: Column(
          children: [
            _buildHeroImageSection(context),

            Obx(
                  () =>
                  _buildSection("${homeController.formData.value?.heading1}",
                      scrollController1, width, 'isRecommended'),
            ),

            Obx(
                  () =>
                  buildCitySection(
                      "${homeController.formData.value?.heading2}",
                      width,
                      scrollController4),
            ),

            Obx(
                  () =>
                  _buildSection("${homeController.formData.value?.heading3}",
                      scrollController3, width, 'isvisibleDesertsfari'),
            ),
            Obx(
                  () =>
                  _buildSection("${homeController.formData.value?.heading4}",
                      scrollController5, width, 'isvisibleCulturesandattractions'),
            ),
            Obx(
                  () =>
                  _buildSection("${homeController.formData.value?.heading5}",
                      scrollController6, width, 'isvisibleDhowcruise'),
            ),
            Obx(
                  () =>
                  _buildSection("${homeController.formData.value?.heading6}",
                      scrollController2, width, 'isvisibleWaterActivities'),
            ),


            advertisement(
              subHeadingfontsize: 26.14,
              Headingfontsize: 54,
              decoration: BoxDecoration(gradient: backgroundgradient),
            ),


            buildFooter(),
          ],
        ),
      ),
      Positioned(top: 0, left: 0, child: impInformation()),
      Positioned(top: 30, left: 0, child: Header()),
    ]);
  }

  Widget _buildHeroImageSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(top: 100,),
      height: Get.height * .70,
      color: Colors.white,
      child: const HeroImageWidget(
        titleFontSize: 80,
      ),
    );
  }

  Widget _buildSection(String heading, ScrollController? controller,
      double? width, String? filterProperty) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * .001),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              _buildTourCards(controller, filterProperty),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCitySection(String heading, double? width,
      ScrollController? controller) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              SizedBox(
                height: Get.height * .5,
                width: Get.width * .9,
                child: Stack(
                  children: [
                    CityList(),

                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 20),
      child: Center(
        child: SelectableText(
          heading,
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
              color: Colors.black,
              letterSpacing: .5,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTourCards(ScrollController? controller, String? filterProperty) {
    return Container(
      color: Colors.white,
      height: Get.height * .40,
      width: Get.width * 0.9,
      child: Stack(
        children: [
          Obx(() {
            if (tourListController.tours.isEmpty) {
              return const CircularProgressIndicator(
                color: colorPrimary,
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TourCards(
                  cardWidth: Get.width * 0.235,
                  tours: tourListController.tours,
                  scrollController: controller,
                  filterProperty: filterProperty,
                ),
              );
            }
          }),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: IconButton(
                onPressed: () {
                  _scrollToPrevious(controller);
                },
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: IconButton(
                onPressed: () {
                  _scrollToNext(controller);
                },
                color: Colors.white,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToNext(ScrollController? scrollController) {
    if (scrollController != null && scrollController.hasClients) {
      double offset = scrollController.offset + Get.width * 0.30;
      double maxOffset = scrollController.position.maxScrollExtent;
      scrollController.animateTo(
        offset > maxOffset ? maxOffset : offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToPrevious(ScrollController? scrollController) {
    if (scrollController != null && scrollController.hasClients) {
      double offset = scrollController.offset - Get.width * 0.30;
      double minOffset = scrollController.position.minScrollExtent;
      scrollController.animateTo(
        offset < minOffset ? minOffset : offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
Widget impInformation(){
  return   Container(
    width: Get.width, // Match the width of the screen
    height: 30, // Fixed height for the container

    child: Marquee(
      children: [
        // Wrap each child in a Container with fixed width to ensure scrolling works correctly
        Container(
          color: colorMediumBlue,
          height:30,
          width: Get.width, // Full width of the screen
          child: Center(
            child: Text(
              "Your important information goes here",
              style: H1(Get.context!).copyWith(fontSize: 14),
            ),
          ),
        ),
        // Add more children as needed
      ],

      reverse: true,
      // Set reverse scrolling

      vertical: false,
      repeat: 3,
      duration: Duration(seconds: 30),
      gap: 0.0,
      pauseOnHover: true, // Acceleration duration
    ),
  );
}
