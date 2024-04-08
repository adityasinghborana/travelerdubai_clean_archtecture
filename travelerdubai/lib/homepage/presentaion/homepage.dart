import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/widgets/footer.dart';
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

import '../../Components/build_city.dart';
import '../../core/controller/headercontroller.dart';
import '../../core/widgets/header.dart';
import '../../experiences/Presentation/experiences_controller.dart';
import '../../experiences/remote/experiences_remote_service.dart';

class Homepage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final TourlistController tourListController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));

  final ScrollController? scrollController1 = ScrollController();
  final ScrollController? scrollController2 = ScrollController();

  final ScrollController? scrollController3 = ScrollController();
  final ScrollController? scrollController4 = ScrollController();
  final HeaderController headerController = Get.put(HeaderController());

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(
      ExperienceController(
        GetExperiencesUseCase(
          ExperiencesRepositoryImpl(
            ExperienceRemoteService(Dio()),
          ),
        ),
      ),
    );
    double? width = MediaQuery.of(context).size.width;

    return Stack(children: [
      SingleChildScrollView(
controller: scrollController4,
        child: Column(
          children: [
            //This is the first section
            _buildHeroImageSection(context),
            //This contains form as well as the text Feature
            // _buildFormSection(context),

            // This contain heading as well as list
            Obx(
              () => _buildSection("${homeController.formData.value?.heading1}",
                  scrollController1, width, 'isRecommended'),
            ),
            // This contain heading as well as list
            Obx(
              () => BuildCitySection(
                  "${homeController.formData.value?.heading2}",
                  width,
                  scrollController2),
            ),

            Obx(
              () => _buildSection("${homeController.formData.value?.heading3}",
                  scrollController3, width, 'isPopular'),
            ),
            advertisement(
              subHeadingfontsize: 26.14,
              Headingfontsize: 54,
            ),

            buildFooter(),
          ],
        ),
      ),
      Positioned(top: 0, left: 0, child: Header()),
    ]);
  }

  Widget _buildHeroImageSection(BuildContext context) {
    return Container(
      height: Get.height * .85,
      color: Theme.of(context).colorScheme.secondary,
      child: HeroImageWidget(
        titlefontsize: 80,
      ),
    );
  }

  Widget _buildSection(String heading, ScrollController? controller,
      double? width, String? filterProperty) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * .076),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              _buildTourCards(controller, filterProperty),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget BuildCitySection(
      String heading, double? width ,ScrollController? controller) {

    return Container(

      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              Container(
                  height: Get.height * .5,
                  width: Get.width * .9,
                  child: Stack(children: [
                    CityList(Controller: controller!),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: IconButton(
                          onPressed: () {
                            _scrollToPrevious(controller!);
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
                            _scrollToNext(controller!);
                          },
                          color: Colors.white,
                          icon: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ),
                  ])),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Padding(
      padding: EdgeInsets.only(
        left: 60, right: 20, ),
      child: Center(
        child: SelectableText(
          heading,
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTourCards(ScrollController? controller, String? filterProperty) {
    return Container(
      color: Colors.white,
      height: Get.height * .5,
      width: Get.width * 0.9,

      // Adjust the height according to your needs
      child: Stack(
        children: [
          Obx(() {
            if (tourListController.tours.isEmpty) {
              return const CircularProgressIndicator(
                color: colorPrimary,
              );
            } else {
              return TourCards(
                cardWidth: Get.width * 0.18,
                tours: tourListController.tours,
                scrollController: controller,
                filterProperty: filterProperty,
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
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToNext(ScrollController? scrollController) {
    double? offset = scrollController?.offset;
    double? newOffset = offset! + Get.width * 0.30; // Adjust width of cards
    if (newOffset > scrollController!.position.maxScrollExtent) {
      newOffset = scrollController.position.maxScrollExtent;
    }
    scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToPrevious(ScrollController? scrollController) {
    double? offset = scrollController?.offset;
    double newOffset = offset! - Get.width * 0.30; // Adjust width of cards
    if (newOffset < scrollController!.position.minScrollExtent) {
      newOffset = scrollController.position.minScrollExtent;
    }
    scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
