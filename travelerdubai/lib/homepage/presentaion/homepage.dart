import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/homepage/mygridscetio_controller.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/cities.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/formsection.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/gridsection.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/heroimage.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/tourscard.dart';
import 'package:travelerdubai/core/widgets/footer.dart';
import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

import '../../experiences/remote/experiences_remote_service.dart';

class Homepage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final MyGridSectionController controller = Get.put(MyGridSectionController());
  final TourlistController tourlistController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorwhite,
      height: Get.height - 100,
      child: ListView(
        children: [
          _buildHeroImageSection(context),
          _buildFormSection(context),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading2}")),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading3}")),
          const MyGridSectionWidget(),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading4}")),
          _buildHeading("Look By Cities"),
          Container(
              color: Colors.white, height: Get.height * .3, child: CityList()),
          buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeroImageSection(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: Container(
        height: Get.height * .70,
        color: Theme.of(context).colorScheme.secondary,
        child: HeroImageWidget(),
      ),
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      width: Get.width,
      height: Get.height * .60,
      child: const FormWidget(),
    );
  }

  Widget _buildSection(String heading) {
    return Container(
      color: Colors.white,
      height: Get.height * .80,
      child: Column(
        children: [
          _buildHeading(heading),
          _buildTourCards(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SelectableText(
          heading ?? "form could not be displayed, connect from backend",
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 48,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTourCards() {
    return Container(
      color: Colors.white,
      height: Get.height * .55,
      child: Obx(
        () {
          if (tourlistController.tours.isEmpty) {
            return const CircularProgressIndicator(
              color: colorPrimary,
            );
          } else {
            return Tourcards(
              tours: tourlistController.tours,
            );
          }
        },
      ),
    );
  }
}
