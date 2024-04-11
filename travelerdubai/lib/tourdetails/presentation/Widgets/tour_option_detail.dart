import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/ui_state.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';

import '../../../Cart/data_layer/model/request/update_cart.dart';
import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/update_cart.dart';
import '../../../core/controller/headercontroller.dart';
import '../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../timeslot_data_layer/service/timslot_remote.dart';
import '../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../tour_options_controller.dart';
import 'button.dart';

Widget options(String tourname) {
  return Obx(() {
    final TourOptionStaticDataController optionsstatic = Get.put(
      TourOptionStaticDataController(
          GetTourOptionsStaticDataUseCase(
            TourOptionsRepositoryImpl(
              TourOptionRemoteService(Dio()),
            ),
          ),
          GetTourOptionsDynamicDataUseCase(
            TourOptionsRepositoryImpl(
              TourOptionRemoteService(Dio()),
            ),
          ),
          GetTimeSlotUseCase(
              TimeSlotRepositoryImpl(TimeSlotRemoteService(Dio()))),
          UpdateCartUseCase(
            CartRepositoryImpl(
              CartRemoteService(Dio()),
            ),
          )),
    );
    final HeaderController controller = Get.find();
    var output = optionsstatic.options.value;

    var output1 = optionsstatic.dynamicoptions.toList();

    if (kDebugMode) {
      print('output1 is${output1.toString()}');
    }

    switch (output.state) {
      case UiState.SUCCESS:
        return Expanded(
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: optionsstatic.options.value.data?.length,
            itemBuilder: (BuildContext context, int index) {
              int? id = optionsstatic.options.value.data?[index].tourId;
              int tourIdIndex =
                  output1.indexWhere((element) => element.tourId == id);
              optionsstatic.optionid.value = output.data![index].tourOptionId!;
              if (kDebugMode) {
                print("optionId is ${optionsstatic.optionid.value}");
              }
              optionsstatic.transferid.value =
                  output1.isNotEmpty ? output1[tourIdIndex].transferId! : 0;
              if (kDebugMode) {
                print('transferId is ${optionsstatic.transferid.value}');
              }

              optionsstatic.gettimeSlots();
              var output2 = optionsstatic.timeslots;
              if (kDebugMode) {
                print('output2 is${output2.toString()}');
              }

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
                                        "${optionsstatic.options.value.data?[index].optionName}",
                                        style: bodyblack(context).copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : const Text(''),
                              Obx(() {
                                if (optionsstatic
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
                                                  " ${(output1[index].finalAmount ?? 0) + (optionsstatic.pricing.value.addPriceAdult ?? 0) + (optionsstatic.pricing.value.addPriceChildren ?? 0) + (optionsstatic.pricing.value.additionalPriceInfant ?? 0)}",
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
                                if (optionsstatic.timeslots.isNotEmpty) {
                                  var lst = output2.isNotEmpty
                                      ? output2
                                          .map((timeslot) => timeslot.timeSlot)
                                          .toList()
                                      : <String>['1hr', '2hr', '3hr', '4hr'];
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
                                        child: DropdownButtonFormField<String>(
                                          decoration:
                                              const InputDecoration.collapsed(
                                                  hintText: ''),
                                          // Initial value, you can change it according to your requirement
                                          onChanged: (String? newValue) {
                                            // Handle dropdown value change
                                          },
                                          items: lst // Your dropdown options
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Flexible(
                                    flex: 1,
                                    child: Text("No timeslot required "),
                                  ); // Return an empty Text widget if dateTextController is empty
                                }
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
                                        tourname: tourname,
                                        tourOption: data.transferName!,
                                        tourId: data.tourId!,
                                        optionId: data.tourOptionId!,
                                        adult: optionsstatic
                                            .adultsSelectedValue.value,
                                        child: optionsstatic
                                            .childrenSelectedValue.value,
                                        infant: optionsstatic
                                            .infantsSelectedValue.value,
                                        tourDate: optionsstatic
                                            .selectedDate.value
                                            .toString()
                                            .substring(0, 10),
                                        timeSlotId: optionsstatic
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
                                            (optionsstatic.pricing.value
                                                    .addPriceAdult ??
                                                0) +
                                            (optionsstatic.pricing.value
                                                    .addPriceChildren ??
                                                0) +
                                            (optionsstatic.pricing.value
                                                    .additionalPriceInfant ??
                                                0)),
                                        cartId: controller.cartId.value);
                                    print(("${controller.cartId.value} Hello"));

                                    optionsstatic.Addtocart(value);
                                    print(value.toJson());
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Center(
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
