import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/bottom_nav.dart';
import 'package:travelerdubai/core/widgets/Mobileheader.dart';
import 'package:travelerdubai/core/widgets/drawer.dart';
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

import '../../Components/Advertisement.dart';
import '../../Components/buid_heading.dart';
import '../../Components/build_city.dart';
import '../../core/constants/constants.dart';
import '../../experiences/Presentation/experiences_controller.dart';
import '../../experiences/remote/experiences_remote_service.dart';

class HomePageMobile extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));

  final TourlistController tourlistController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));
  final PageController? pageController = Get.put(PageController());
  final ScrollController? scrollController1 = ScrollController();

  final ScrollController? scrollController2 = ScrollController();
  final ScrollController? scrollController3 = ScrollController();
  final ScrollController? scrollController4 = ScrollController();

  HomePageMobile({super.key});

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
    return Scaffold(
      drawer: drawer(),
      appBar: MobileHeader(isBackButton: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              child: HeroImageWidget(
                titlefontsize: 32,
              ),
            ),
            Obx(
              () => buildSection("${homeController.formData.value?.heading1}",
                  width, scrollController4),
            ),
            Obx(
              () => buildCitySection(
                  "${homeController.formData.value?.heading2}",
                  scrollController2,
                  width),
            ),
            Obx(
              () => buildSection(
                  "${homeController.formData.value?.heading3}", width,scrollController3),
            ),
            advertisement(subHeadingfontsize: 18, Headingfontsize: 28),
            buildFooter(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildSection(
      String heading, double? width, ScrollController? controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.015),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeading(heading),
              buildTourCards(),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTourCards() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.015,
      ),
      color: Colors.white,
      height: Get.height * .3,

      // Adjust the height according to your needs
      child: Stack(
        children: [
          Obx(() {
            if (tourlistController.tours.isEmpty) {
              return const CircularProgressIndicator(
                color: colorPrimary,
              );
            } else {
              return TourCards(
                scrollController: scrollController2,
                tours: tourlistController.tours,
                cardWidth: Get.width * .4,
                filterProperty: '',
              );
            }
          }),
        ],
      ),
    );
  }

  Widget buildCitySection(
      String heading, ScrollController? controller, double? width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * .076),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeading(heading),
              Container(
                  height: Get.height * .3,
                  width: Get.width,
                  child: CityList(Controller: scrollController2!)),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
