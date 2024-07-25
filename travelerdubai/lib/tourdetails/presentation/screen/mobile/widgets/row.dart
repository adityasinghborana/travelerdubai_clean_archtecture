import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/widgets/timeslots.dart';

import '../../../../../Cart/data_layer/model/request/update_cart.dart';
import '../../../../../Components/custom_button.dart';
import '../../../../../core/controller/headercontroller.dart';
import '../../../tour_options_controller.dart';
import '../../../tours_controller.dart';


class InfoAndButtonRow extends StatelessWidget {
  final Widget widgets;
  final int tourOptionId;
  final int index;

  InfoAndButtonRow({
    required this.widgets,
    required this.tourOptionId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final TourOptionStaticDataController static = Get.find();
    final TourController tourController = Get.find();
    final HeaderController controller = Get.put(HeaderController());

    return Obx(
          () {
        var filteredTimeSlots = static.timeslots.value
            .firstWhere((ts) => ts[0].tourOptionId == tourOptionId,
            orElse: () => [])
            .toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      onClosing: () {
                        // This callback is called when the bottom sheet is closed
                        print("BottomSheet is closing");
                      },
                      builder: (BuildContext context) {
                        // Return the content of your bottom sheet here
                        return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            height: Get.height * .70, // Adjust height as needed
                            child: widgets);
                      },
                    ),
                  );
                },
                child: const Text(
                  'More Info  ',
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              if (tourController.tour.value.isSlot == true &&
                  controller.loggedIn.isTrue)
                SizedBox(
                  width: Get.width * .55,
                  child: ButtonView(
                    borderColor: Colors.transparent,
                    btnName: 'Time Slots',
                    bgColor: colorMediumBlue,
                    onButtonTap: () {
                      final data = static.output1[index];

                      static.value = UpdateCartTourDetail(
                          tourname: tourController.tour.value.tourName ?? '',
                          tourOption: data.transferName!,
                          tourId: data.tourId!,
                          optionId: data.tourOptionId!,
                          adult: static.adultsSelectedValue.value,
                          child: static.childrenSelectedValue.value,
                          infant: static.infantsSelectedValue.value,
                          tourDate: static.selectedDate.value
                              .toString()
                              .substring(0, 10),
                          timeSlotId: static.timeSlotId.value,
                          startTime: static.starttime.value,
                          transferId: static.transferId.value,
                          vendoruid: static.vendoruid.value ?? "",
                          adultRate: data.adultPrice!.toDouble(),
                          childRate: data.childPrice?.toDouble() ?? 0.0,
                          serviceTotal:
                          ((static.output1[index].finalAmount ?? 0) +
                              (static.pricing.value.addPriceAdult ?? 0) +
                              (static.pricing.value.addPriceChildren ?? 0) +
                              (static.pricing.value.additionalPriceInfant ??
                                  0)),
                          cartId: controller.cartId.value);
                      print(("${controller.cartId.value} Hello"));
                      if (static.timeslots.isNotEmpty) {
                        static.currOptionId = tourOptionId;
                        Get.dialog(
                          Dialog(
                            child: Container(
                                height: Get.height / 2,
                                child: TimeSlots()),
                          ),
                        );
                        print('curr OptionId is ${static.currOptionId}');
                      } else if (tourController.tour.value.isSlot == true) {
                        Get.dialog(
                          Dialog(
                            child: Container(child: Text("No time slots available"),),
                          ),
                        );
                      } else {
                        if (kDebugMode) {
                          Get.toNamed('/home',
                              preventDuplicates: true,
                              arguments: [filteredTimeSlots, tourOptionId]);
                        }
                      }
                    },
                  ),
                )
              else if (controller.loggedIn.isTrue &&
                  tourController.tour.value.isSlot != true)
                SizedBox(
                  width: Get.width * .55,
                  child: ButtonView(
                    borderColor: Colors.transparent,
                    btnName: 'Add To Cart',
                    bgColor: colorMediumBlue,
                    onButtonTap: () {
                      final data = static.output1[index];
                      static.value = UpdateCartTourDetail(
                          tourname: tourController.tour.value.tourName ?? '',
                          tourOption: data.transferName!,
                          tourId: data.tourId!,
                          optionId: data.tourOptionId!,
                          adult: static.adultsSelectedValue.value,
                          child: static.childrenSelectedValue.value,
                          infant: static.infantsSelectedValue.value,
                          tourDate: static.selectedDate.value
                              .toString()
                              .substring(0, 10),
                          timeSlotId: static.timeSlotId.value,
                          startTime: static.starttime.value,
                          transferId: static.transferId.value ?? 0,
                          vendoruid: static.vendoruid.value ?? "",
                          adultRate: data.adultPrice!.toDouble(),
                          childRate: data.childPrice?.toDouble() ?? 0.0,
                          serviceTotal:
                          ((static.output1[index].finalAmount ?? 0) +
                              (static.pricing.value.addPriceAdult ?? 0) +
                              (static.pricing.value.addPriceChildren ?? 0) +
                              (static.pricing.value.additionalPriceInfant ??
                                  0)),
                          cartId: controller.cartId.value);
                      print(("${controller.cartId.value} Hello"));

                      static.currOptionId = tourOptionId;
                      print('curr OptionId is ${static.currOptionId}');

                      static.Addtocart(static.value);
                    },
                  ),
                )
              else
                ButtonView(
                  btnName: 'Login',
                  onButtonTap: () => Get.toNamed('/login'),
                  borderColor: Colors.transparent,
                  bgColor: colorMediumBlue,
                ),
            ],
          ),
        );
      },
    );
  }
}
