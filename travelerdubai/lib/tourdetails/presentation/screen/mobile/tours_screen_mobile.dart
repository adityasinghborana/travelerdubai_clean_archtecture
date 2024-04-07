import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/footer_mobile.dart';
import 'package:travelerdubai/Components/icon_text_background.dart';
import 'package:travelerdubai/core/widgets/Mobileheader.dart';

import '../../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../../Cart/data_layer/service/cart_remote.dart';
import '../../../../Cart/data_layer/usecase/update_cart.dart';
import '../../../../Components/build_city.dart';
import '../../../../Components/date_picker.dart';
import '../../../../core/constants/contants.dart';
import '../../../../homepage/presentaion/Homepagecontroller.dart';
import '../../../../homepage/remote/homepage_remote_service.dart';
import '../../../../homepage/repository/homepage_repository.dart';
import '../../../../homepage/usecase/usecase.dart';
import '../../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../../timeslot_data_layer/service/timslot_remote.dart';
import '../../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../Widgets/MainDetail.dart';
import '../../Widgets/dropdown_widget.dart';
import '../../Widgets/tour_option_detail.dart';
import '../../Widgets/tranfertype_dropdown.dart';
import '../../tour_options_controller.dart';
import '../../tours_controller.dart';

class TourPageMobile extends StatelessWidget {
  TourPageMobile({super.key});
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));
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
        )),
  );
  final HomeController homeController = Get.put(HomeController(
      GetHomePageDatUseCase(HomeRepositoryImpl(HomeRemoteService(Dio())))));
  final ScrollController? scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    //final double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MobileHeader(),
      body: Obx(
        () {
          if (tourController.isLoading.isTrue) {
            return Center(
                child: const CircularProgressIndicator(
              color: colorblue,
            ));
          } else {
            static.id.value = tourController.tour.value.TourId.toString();
            static.contractid.value =
                tourController.tour.value.contractId.toString();

            static.getOptionsStaticData();

            var tourImages = tourController.tourImages;
            List<String> imageUrls =
                tourImages.map((imageModel) => imageModel.imagePath!).toList();
            double? width = MediaQuery.of(context).size.width;

            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(gradient: backgroundgradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //fixed the header issue

                        MUICarousel(
                          images: imageUrls,
                          maxWidth: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
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
                              horizontal: Get.width * 0.05),
                          child: ButtonView(
                            btnName: 'Buy Tickets',
                            bgColor: colorblue,
                            onButtonTap: () {
                              Get.toNamed("/forms_mobile");
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
                                  iconColor: color_088943,
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
                              iconColor: color_cc7e63,
                              textStyle: iconText),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: IconTextBackground(
                              iconData: Icons.audiotrack,
                              text: 'Audio Guide',
                              backgroundColor:
                                  Color.fromRGBO(0, 154, 184, 0.20),
                              iconColor: color_088943,
                              textStyle: iconText),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                      child: MainDetails(
                        textStyle: detailBoxTextStyleMobile,
                      ),
                    ),
                    Obx(
                      () => buildCitySection(
                          "${homeController.formData.value?.heading2}",
                          scrollController2,
                          width),
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

  Widget formSection() {
    return Card(
      elevation: 25.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(50.0),
          color: colorwhite,
          width: Get.width * 0.9,
          height: Get.height * .6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("No Of Person"),
                  DropdownTransferWidget(
                      label: 'type',
                      selectedValue: static.selectedTransfer.value,
                      onChanged: (value) => static.changeSelectedTransfer),
                  Obx(() => DropdownWidget(
                        label: 'Adults',
                        selectedValue: static.adultsSelectedValue.value,
                        onChanged: (value) =>
                            static.adultsSelectedValue.value = value ?? 1,
                      )),
                  Obx(() => DropdownWidget(
                        label: 'Children',
                        selectedValue: static.childrenSelectedValue.value,
                        onChanged: (value) =>
                            static.childrenSelectedValue.value = value ?? 0,
                      )),
                  Obx(() => DropdownWidget(
                        label: 'Infants',
                        selectedValue: static.infantsSelectedValue.value,
                        onChanged: (value) =>
                            static.infantsSelectedValue.value = value ?? 0,
                      )),
                  dateInputField(static.dateTextController.value, Get.context!,
                      () {
                    static.selectedDate.value =
                        DateTime.parse(static.dateTextController.value.text);
                    static.getOptionsdynamicData();
                    static.gettimeSlots();
                  }, null),
                ],
              ),
              const Divider(
                height: 1,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tour Options "),
                    Text("Price"),
                    Text("TimeSlots"),
                    SizedBox(),
                  ]),
              options(),
            ],
          ),
        ),
      ),
    );
  }
}
