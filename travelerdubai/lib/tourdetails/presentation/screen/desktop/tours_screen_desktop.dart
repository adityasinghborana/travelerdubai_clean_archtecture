import 'dart:collection';

import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/Components/date_picker.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/cities.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';

import '../../../../core/controller/headercontroller.dart';
import '../../../../Components/footer.dart';
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
  final ScrollController ss = ScrollController();
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
          if (kDebugMode) {
            print('in the body obx');
          }
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
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.035),
                          child: AuraUICarousel(
                            duration: Duration(seconds: 3),
                            images: imageUrls,
                            maxWidth: 1340,
                            height: MediaQuery.of(context).size.height * 0.6,
                            showButtons: true,
                            pageController: pageController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${tourController.tour.value.tourName}",
                                style: getH2TextStyle(context).copyWith(color: Colors.black,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.06),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.security_rounded,
                                      // color: const Color.fromRGBO(
                                      //     8, 137, 67, 0.12),
                                      color: color_088943,
                                    ),
                                    Text(
                                      'Secure Checkout',
                                      style: iconText,
                                    ),
                                    Text(
                                      'Fast and Secure Payment',
                                      style: iconText2,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.06),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.fact_check_outlined,
                                      // color: const Color.fromRGBO(
                                      //     8, 137, 67, 0.12),
                                      color: color_088943,
                                    ),
                                    Text(
                                      'Instant confirmation',
                                      style: iconText,
                                    ),
                                    Text(
                                      'Refund Guarantee Option',
                                      style: iconText2,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.06),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.ticket,
                                      // color: const Color.fromRGBO(
                                      //     8, 137, 67, 0.12),
                                      color: color_088943,
                                    ),
                                    Text(
                                      'Official Ticket Seller',
                                      style: iconText,
                                    ),
                                    Text(
                                      'Used by 3m+ people',
                                      style: iconText2,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.06),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    const Icon(
                                      Icons.co_present,
                                      // color: const Color.fromRGBO(
                                      //     8, 137, 67, 0.12),
                                      color: color_088943,
                                    ),
                                    Text(
                                      '24/7 customer service',
                                      style: iconText,
                                    ),
                                    Text(
                                      'Reliable after sales support',
                                      style: iconText2,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        formSection(),
                      ],
                    ),
                   SizedBox(height: 50,),


                       Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.035,right: Get.width * 0.05),
                         child: MainDetails(
                           imageUrl:tourController.tourImages[0].imagePath ??'' ,
                           textStyle: detailBoxTextStyle,
                         ),
                       ),
                    SizedBox(height: 50,),
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        height:300,child: CityList()),
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
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 50),
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
                          },
                        )),
                    Obx(() => DropdownWidget(
                          label: 'Children',
                          selectedValue: static.childrenSelectedValue.value,
                          onChanged: (value) {
                            static.childrenSelectedValue.value = value ?? 0;
                            static.getOptionsDynamicData();
                          },
                        )),
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
                SizedBox(height: 30,),
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
