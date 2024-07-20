import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/footer_mobile.dart';
import 'package:travelerdubai/Components/icon_text_background.dart';

import '../../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../../Cart/data_layer/service/cart_remote.dart';
import '../../../../Cart/data_layer/usecase/update_cart.dart';
import '../../../../Components/build_city.dart';
import '../../../../core/constants/constants.dart';
import '../../../../homepage/presentaion/Homepagecontroller.dart';
import '../../../../homepage/remote/homepage_remote_service.dart';
import '../../../../homepage/repository/homepage_repository.dart';
import '../../../../homepage/usecase/usecase.dart';
import '../../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../../timeslot_data_layer/service/timslot_remote.dart';
import '../../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../Widgets/MainDetail.dart';
import '../../tour_options_controller.dart';
import '../../tours_controller.dart';

class TourPageMobile extends StatelessWidget {
  TourPageMobile({super.key});
  final PageController pageController = PageController();
  final TourOptionStaticDataController static = Get.put(
      TourOptionStaticDataController(
          GetTourOptionsStaticDataUseCase(
              TourOptionsRepositoryImpl(TourOptionRemoteService(Dio()))),
          GetTourOptionsDynamicDataUseCase(
            TourOptionsRepositoryImpl(
              TourOptionRemoteService(Dio()),
            ),
          ),
          GetTimeSlotUseCase(
            TimeSlotRepositoryImpl(
              TimeSlotRemoteService(Dio()),
            ),
          ),
          UpdateCartUseCase(
            CartRepositoryImpl(
              CartRemoteService(Dio()),
            ),
          )));




  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController(
        GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
    final tourId = Get.parameters['tourId'] ?? '';
    final TourController tourController = Get.find();
    //final double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MobileHeader(context: context,),
      body: Obx(
        () {
          if (tourController.isLoading.isTrue) {
            return const Center(
                child: CircularProgressIndicator(
              color: colorblue,
            ));
          } else {
            static.id.value = tourController.tour.value.TourId.toString();
            static.contractid.value =
                tourController.tour.value.contractId.toString();
            static.vendoruid.value=tourController.tour.value.vendorUid ?? '';
            static.starttime.value=tourController.tour.value.startTime ?? '';
            static.isvendor.value =tourController.tour.value.isVendorTour ?? false;
            if (kDebugMode) {
              print("${static.id.value} hello tour Detail");
            }
            if (kDebugMode) {
              print("${static.contractid.value} hello tour Detail");
            }

            var tourImages = tourController.tourImages;
            List<String> imageUrls =
                tourImages.map((imageModel) => imageModel.imagePath!).toList();
            double? width = MediaQuery.of(context).size.width;

            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: colorwhite),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //fixed the header issue

                        AuraUICarousel(
                          images: imageUrls,
                     showIndicator: false,
                          height: MediaQuery.of(context).size.height * 0.3,
                          pageController: pageController,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${tourController.tour.value.tourName}",
                                style: getH2TextStyle(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05,vertical: 20),
                          child: ButtonView(
                            borderColor: Colors.transparent,
                            btnName: 'Buy Tickets',
                            bgColor: colorblue,
                            onButtonTap: () {
                              Get.toNamed(
                                "/forms_mobile",
                                parameters: {'tourId': tourId},
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconTextBackground(
                                  iconData: Icons.remove_red_eye,
                                  text: 'Open Today',
                                  backgroundColor:
                                      Color.fromRGBO(8, 137, 67, 0.12),
                                  iconColor: colorgreen,
                                  textStyle: iconText),
                              Text(
                                'Visit Timing',
                                style: iconText,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: IconTextBackground(
                              iconData: Icons.access_time_filled,
                              text: 'Explore at your pace',
                              backgroundColor:
                                  const Color.fromRGBO(204, 126, 99, 0.20),
                              iconColor: colorLightBrown,
                              textStyle: iconText),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: IconTextBackground(
                              iconData: Icons.audiotrack,
                              text: 'Audio Guide',
                              backgroundColor:
                                  const Color.fromRGBO(0, 154, 184, 0.20),
                              iconColor: colorgreen,
                              textStyle: iconText),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                      child: MainDetails(
                        imageUrl: tourController.tourImages[0].imagePath ?? '',
                        textStyle: detailBoxTextStyleMobile,
                      ),
                    ),
                    Obx(
                      () => buildCitySection(
                        "${homeController.formData.value?.heading2}",
                        width,
                      ),
                    ),
                    buildFooterMobile()
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
