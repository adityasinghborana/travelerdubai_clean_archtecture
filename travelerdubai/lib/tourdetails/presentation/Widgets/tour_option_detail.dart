import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/ui_state.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../Cart/data_layer/model/request/update_cart.dart';
import '../../../core/controller/headercontroller.dart';
import '../tour_options_controller.dart';
import 'button.dart';

Widget options(String tourName) {

  final TourOptionStaticDataController optionsStatic = Get.find();


  final HeaderController controller = Get.find();
  return Obx(() {
    if (kDebugMode) {
      print('in the options first obx line');
    }
    var output = optionsStatic.options.value;
    if (kDebugMode) {
      print('output state is ${output.state}');
    }
    var output1 = optionsStatic.dynamicoptions.toList();
    if (kDebugMode) {
      print('output1 is ${output1.toString()}');
    }

    switch (output.state) {

      case UiState.SUCCESS:
        return Expanded(
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: optionsStatic.options.value.data?.length,
            itemBuilder: (BuildContext context, int index) {
              optionsStatic.timeslots.clear();
              optionsStatic.getTimeSlots(optionsStatic.options.value.data?[index].tourOptionId??0);

              int? id = optionsStatic.options.value.data?[index].tourId;
              int tourIdIndex =
                  output1.indexWhere((element) => element.tourId == id);
              optionsStatic.optionId.value = output.data![index].tourOptionId!;
              if (kDebugMode) {
                print("optionId is ${optionsStatic.optionId.value}");
              }
              if (optionsStatic.transferId.value == 0) {
                optionsStatic.transferId.value =
                    output1.isNotEmpty ? output1[tourIdIndex].transferId! : 0;
              }
              if (kDebugMode) {
                print('transferId is ${optionsStatic.transferId.value}');
              }

              // var output2 = optionsStatic.timeslots.value.data!;
              // ever(optionsStatic.timeslots, (timeSlotResult) {
              //   output2 = optionsStatic.timeslots.value.data!;
              //   if (kDebugMode) {
              //     print('output2 is${output2.toString()}');
              //   }
              // });

              // List<RxBool> showChanged = List.generate(
              //     optionsstatic.options.value.data!.length,
              //     (index) => false.obs);
              return output1.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              index >= 0
                                  ? SizedBox(
                                      width: Get.width * 0.20,
                                      child: Text(
                                        "${optionsStatic.options.value.data?[index].optionName}",
                                        style: bodyblack(context).copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : const Text(''),
                              Obx(() {
                                if (optionsStatic
                                        .dateTextController.value.text !=
                                    '') {
                                  return Flexible(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Price",
                                          style: bodyblack(context).copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.03,
                                        ),
                                        Container(
                                          width: Get.width * 0.09,
                                          alignment: Alignment.center,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.008),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "AED",
                                                  style: bodyblack(context)
                                                      .copyWith(
                                                          fontSize:
                                                              Get.width * 0.01,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                Text(
                                                  " ${(output1[index].finalAmount ?? 0) + (optionsStatic.pricing.value.addPriceAdult ?? 0) + (optionsStatic.pricing.value.addPriceChildren ?? 0) + (optionsStatic.pricing.value.additionalPriceInfant ?? 0)}",
                                                  style: bodyblack(context)
                                                      .copyWith(
                                                          fontSize:
                                                              Get.width * 0.01,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Text(
                                      " fetching"); // Return an empty Text widget if dateTextController is empty
                                }
                              }), // SizedBox(
                              Obx(() {


                                var optionsSize=optionsStatic.timeslots.value.length;
                                if (index>=optionsSize  ){
                                  return Text("Time Slot not avialable");
                                }
                                var lst = optionsStatic
                                    .timeslots.value.isNotEmpty
                                    ? optionsStatic.timeslots.value[index]
                                    .map((timeslot) =>
                                timeslot.timeSlot)
                                    .toList()
                                    : <String>[
                                  '1hr',
                                  '2hr',
                                  '3hr',
                                  '4hr'
                                ];
                                RxString? val = lst[0].obs;

                                return Expanded(
                                  child: Container(
                                    width: 148,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1,
                                            color: Color(0xFFD9D9D9)),
                                        borderRadius:
                                        BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: DropdownButtonFormField<
                                          String>(
                                          decoration:
                                          const InputDecoration
                                              .collapsed(
                                              hintText: ''),
                                          // Initial value, you can change it according to your requirement
                                          onChanged: (String? newValue) {
                                            // Handle dropdown value change
                                            optionsStatic
                                                .timeSlotId.value =
                                                int.parse(
                                                    newValue ?? "0");
                                            val.value = newValue!;
                                          },
                                          items:
                                          lst // Your dropdown options
                                              .map<
                                              DropdownMenuItem<
                                                  String>>((String
                                          value) {
                                            return DropdownMenuItem<
                                                String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: val.value),
                                    ),
                                  ),
                                );
                              }), // SizedBox(
                              //   height: 300,
                              //   width: 450,
                              //   child: Optionpricing(),
                              // ),
                              Flexible(
                                flex: 1,
                                child: InlineFlexButton(
                                  vpadding: 20,
                                  hpadding: 30,
                                  bgcolor: colorblue,
                                  label: 'Add To Cart',
                                  onPressed: () async {
                                    final data = output1[index];
                                    var value = UpdateCartTourDetail(
                                        tourname: tourName,
                                        tourOption: data.transferName!,
                                        tourId: data.tourId!,
                                        optionId: data.tourOptionId!,
                                        adult: optionsStatic
                                            .adultsSelectedValue.value,
                                        child: optionsStatic
                                            .childrenSelectedValue.value,
                                        infant: optionsStatic
                                            .infantsSelectedValue.value,
                                        tourDate: optionsStatic
                                            .selectedDate.value
                                            .toString()
                                            .substring(0, 10),
                                        timeSlotId: optionsStatic
                                            .timeSlotId.value,
                                        startTime: data.startTime!,
                                        transferId: data.transferId!,
                                        adultRate: data.adultPrice!.toDouble(),
                                        childRate: data
                                                .childPrice
                                                ?.toDouble() ??
                                            0.0,
                                        serviceTotal: ((output1[index]
                                                    .finalAmount ??
                                                0) +
                                            (optionsStatic.pricing.value
                                                    .addPriceAdult ??
                                                0) +
                                            (optionsStatic.pricing.value
                                                    .addPriceChildren ??
                                                0) +
                                            (optionsStatic.pricing.value
                                                    .additionalPriceInfant ??
                                                0)),
                                        cartId: controller.cartId.value);
                                    print(("${controller.cartId.value} Hello"));

                                    optionsStatic.Addtocart(value);
                                    print(value.toJson());
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        );
      case UiState.EMPTY:
        return const Text('Empty');
      case UiState.LOADING:
        return const CircularProgressIndicator();
      case UiState.ERROR:
        return const Text('Error');
    }
  });
}
