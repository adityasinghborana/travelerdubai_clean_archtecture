import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/Components/advertisement_mobile.dart';
import 'package:travelerdubai/Components/bottom_nav.dart';
import 'package:travelerdubai/auth/presentation/screens/signup.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/repository/Experiences_repository.dart';
import 'package:travelerdubai/homepage/mygridscetio_controller.dart';
import 'package:travelerdubai/homepage/presentaion/Homepagecontroller.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/heroimage.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/tourscard.dart';
import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';
import '../../Components/Advertisement.dart';
import '../../core/constants/contants.dart';
import '../../core/controller/headercontroller.dart';
import '../../experiences/remote/experiences_remote_service.dart';

class HomePageMobile extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final MyGridSectionController controller = Get.put(MyGridSectionController());
  final TourlistController tourlistController = Get.put(TourlistController(
      GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));
  final PageController? pageController = Get.put(PageController());
  final ScrollController? scrollController1 = ScrollController();

  final HeaderController headerController = Get.put(HeaderController());

  HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "./assets/logo.png",
            width: MediaQuery.of(context).size.width * .4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController1,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              child: HeroImageWidget(
                titlefontsize: 32,
              ),
            ),
            //This contains form as well as the text Feature
            // _buildFormSection(context),

            // This contain heading as well as list
            Obx(
              () => _buildSection("${homeController.formData.value?.heading2}",
                   width),
            ),
            Obx(
              () => _buildSection("${homeController.formData.value?.heading3}",
                   width),
            ),
            // const MyGridSectionWidget(),
            Obx(
              () => _buildSection("${homeController.formData.value?.heading4}",
                   width),
            ),
            advertisementMobile(subHeadingfontsize: 18, Headingfontsize: 28),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildSection(
      String heading,  double? width) {
    return Container(
       margin:EdgeInsets.symmetric(vertical: Get.height*0.015,horizontal: Get.width*0.01),

      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(heading),
              _buildTourCards(),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Center(
      child: SelectableText(
        heading,
        style: GoogleFonts.playfairDisplay(
          textStyle: const TextStyle(
              color: Colors.black,
              letterSpacing: .5,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTourCards() {
    return Container(
      margin:EdgeInsets.symmetric(vertical: Get.height*0.015,horizontal: Get.width*0.01) ,
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
                cardwidth: Get.width * .4,
                tours: tourlistController.tours,

              );
            }
          }),
        ],
      ),
    );
  }
}
