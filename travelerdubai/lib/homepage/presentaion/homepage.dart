import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/footer.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';
import 'package:travelerdubai/homepage/mygridscetio_controller.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/formsection.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/heroimage.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/tourscard.dart';
import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

import '../../core/controller/headercontroller.dart';
import '../../core/widgets/header.dart';
import '../../experiences/remote/experiences_remote_service.dart';

class Homepage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final MyGridSectionController controller = Get.put(MyGridSectionController());
  final TourlistController tourlistController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));
  final PageController? pageController = Get.put(PageController());
  final ScrollController? scrollController1 = ScrollController();
  final ScrollController? scrollController2 = ScrollController();
  final ScrollController? scrollController3 = ScrollController();
  final ScrollController? scrollController4 = ScrollController();
  final HeaderController headerController = Get.put(HeaderController());

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    scrollController4?.addListener(() {
      headerController.updateHeaderBackground(scrollController4!.offset);
    });
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
              () => _buildSection("${homeController.formData.value?.heading2}",
                  scrollController1, width),
            ),
            Obx(
              () => _buildSection("${homeController.formData.value?.heading3}",
                  scrollController2, width),
            ),
            // const MyGridSectionWidget(),
            Obx(
              () => _buildSection("${homeController.formData.value?.heading4}",
                  scrollController3, width),
            ),
            advertisement(),
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
      child: HeroImageWidget(),
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      width: Get.width,
      height: Get.height * .95,
      child: const FormWidget(),
    );
  }

  Widget _buildSection(
      String heading, ScrollController? controller, double? width) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: width! * 0.10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              _buildTourCards(controller),
              const SizedBox(height: 40),
            ],
          ),
          SizedBox(
            width: width * 0.10,
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 60, right: 20, bottom: 20),
      child: Center(
        child: SelectableText(
          heading,
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

  Widget _buildTourCards(ScrollController? controller) {
    return Container(
      color: Colors.white,
      height: Get.height * .60,
      width: Get.width * .80, // Adjust the height according to your needs
      child: Stack(
        children: [
          Obx(() {
            if (tourlistController.tours.isEmpty) {
              return const CircularProgressIndicator(
                color: colorPrimary,
              );
            } else {
              return TourCards(
                tours: tourlistController.tours,
                scrollController: controller,
              );
            }
          }),
          Positioned(
            left: 0,
            top: Get.height * .30,
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
          Positioned(
            right: 10,
            top: Get.height * .30,
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
    double? newOffset = offset! + Get.width * 0.90; // Adjust width of cards
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
    double newOffset = offset! - Get.width * 0.90; // Adjust width of cards
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
