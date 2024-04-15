import 'dart:collection';

import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/Components/date_picker.dart';
import 'package:travelerdubai/Components/ui_state.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/cities.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';

import '../../../../Components/icon_text_background.dart';
import '../../../../core/controller/headercontroller.dart';
import '../../../../core/widgets/footer.dart';
import '../../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../Widgets/MainDetail.dart';
import '../../Widgets/dropdown_widget.dart';
import '../../Widgets/tranfertype_dropdown.dart';

class TourPageDesktop extends StatelessWidget {

  TourPageDesktop({super.key});
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));
  final HeaderController controller = Get.find();
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
        )),
  );

  @override
  Widget build(BuildContext context) {
    static.dateTextController.value.text = DateTime.now()
        .add(
      // Add a duration representing the specified number of hours.
      Duration(hours: tourController.tour.value.cutOffhrs ?? 0),
    )
        .toString()
        .substring(0, 10);
    static.selectedDate.value = DateTime.now().add(
      // Add a duration representing the specified number of hours.
        Duration(hours: tourController.tour.value.cutOffhrs ?? 0));
    if (kDebugMode) {
      print("${controller.cartId.value} hello tour detail");
    }
    ever(tourController.isLoading, (isLoading) {
      if (!isLoading) {
        static.id.value = tourController.tour.value.TourId.toString();
        static.contractid.value =
            tourController.tour.value.contractId.toString();
        static.getOptionsStaticData();
      }
    });

    //final double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text("Add to Cart"),
        onPressed: () => Get.toNamed("/checkout"),
      ),
      body: Obx(
            () {
          print('in the body obx');
          if (tourController.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (kDebugMode) {
              print(
                  'in the obx the options stats is ${static.options.value.state}');
            }
            var tourImages = tourController.tourImages;
            List<String> imageUrls =
            tourImages.map((imageModel) => imageModel.imagePath!).toList();

            var optionsOutput = static.options.value.state;
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(gradient: backgroundgradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        //fixed the header issue
                        Header(),
                        AuraUICarousel(
                          images: imageUrls,
                          maxWidth: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          showButtons: false, pageController: pageController,
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
                          padding:
                          EdgeInsets.symmetric(vertical: Get.height * 0.01),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconTextBackground(
                                        iconData: Icons.remove_red_eye,
                                        text: 'Open Today',
                                        backgroundColor: const Color.fromRGBO(
                                            8, 137, 67, 0.12),
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
                                    backgroundColor: const Color.fromRGBO(
                                        204, 126, 99, 0.20),
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
                                    const Color.fromRGBO(0, 154, 184, 0.20),
                                    iconColor: color_088943,
                                    textStyle: iconText.copyWith(fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                        formSection(),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: MainDetails(
                              textStyle: detailBoxTextStyle,
                            ),
                          ),
                          Flexible(flex: 1, child: Container())
                        ],
                      ),
                    ),
                    CityList(),
                    buildFooter()
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
    HashMap<String, int> transferOptionsMap = HashMap<String, int>();
    if (kDebugMode) {
      print('static.dynamic length is ${static.dynamicoptions.length}');
      print(
          'in the form section optins state is ${static.options.value.state}');
    }

    if (static.dynamicoptions.isNotEmpty) {
      static.dynamicoptions.forEach((tourOptionsDynamicResult) {
        // Assuming tourOptionsDynamicResult.transferName and tourOptionsDynamicResult.transferId are not null
        static.addUniquePair(
          transferOptionsMap,
          tourOptionsDynamicResult.transferName!,
          tourOptionsDynamicResult.transferId!,
        );
      });
      static.selectedTransfer.value = static.dynamicoptions[0].transferName!;
    }
    if (kDebugMode) {
      print('transferOptionMap is$transferOptionsMap');
    }
    return Obx(() {
      return Card(
        elevation: 25.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(50.0),
            color: colorwhite,
            width: Get.width * 0.9,
            height: Get.height * .5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => DropdownWidget(
                        label: 'Adults',
                        selectedValue: static.adultsSelectedValue.value,
                        onChanged: (value) {
                          static.adultsSelectedValue.value = value ?? 1;
                          static.getOptionsDynamicData();
                        })),
                    Obx(() => DropdownWidget(
                        label: 'Children',
                        selectedValue: static.childrenSelectedValue.value,
                        onChanged: (value) {
                          static.childrenSelectedValue.value = value ?? 0;
                          static.getOptionsDynamicData();
                        })),
                    Obx(() => DropdownWidget(
                        label: 'Infants',
                        selectedValue: static.infantsSelectedValue.value,
                        onChanged: (value) {
                          static.infantsSelectedValue.value = value ?? 0;
                          //  static.getOptionsDynamicData();
                        })),

                    Obx(() {
                      return dateInputField(
                          static.dateTextController.value, Get.context!, () {
                        static.changePickedDate(DateTime.parse(
                            static.dateTextController.value.text));

                        //static.getTimeSlots();
                      }, null);
                    }),
                    DropdownTransferWidget(
                      label: 'type',
                      selectedValue: static.selectedTransfer.value,
                      // onChanged: (value) {
                      //   static.selectedTransfer.value = value!;
                      //
                      // },
                      onChanged: (value) {
                        static.changeSelectedTransfer(value);
                      },
                      items: transferOptionsMap.keys.toList(),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                ),
                options(tourController.tour.value.tourName!),
              ],
            ),
          ),
        ),
      );
    });
  }
}