import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../../Cart/data_layer/model/request/update_cart.dart';
import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/update_cart.dart';
import '../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../timeslot_data_layer/service/timslot_remote.dart';
import '../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../tour_options_controller.dart';

class Optionpricing extends StatelessWidget {
  final TourOptionStaticDataController optionsdynamic = Get.put(
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

  final HeaderController controller = Get.find();

  Optionpricing({super.key});

  @override
  Widget build(BuildContext context) {
    optionsdynamic.getOptionsdynamicData();
    return optionsdynamic.dynamicoptions.isNotEmpty ? ListView.builder(
      itemCount: optionsdynamic.dynamicoptions.length,
      itemBuilder: (BuildContext context, int index) {
        optionsdynamic.getOptionsdynamicData();
        final data = optionsdynamic.dynamicoptions[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use Expanded to make sure Text widget doesn't overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data.transferName}"),
                    Text("${data.tourOptionId}"),
                    Text(
                      "Amount ${(optionsdynamic.pricing.value.addPriceAdult!.toDouble() + optionsdynamic.pricing.value.addPriceChildren!.toDouble() + optionsdynamic.pricing.value.additionalPriceInfant!.toDouble() + data.finalAmount!.toDouble())}",
                    ),
                  ],
                ),
              ),

              // Use Expanded for the ExpansionTile and Obx
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      title: Text('TimeSlots'),
                      onExpansionChanged: (value) {
                        // Fetch data when the expansion tile is clicked
                        if (value) {
                          optionsdynamic.optionid.value = data.tourOptionId!;
                          optionsdynamic.transferid.value = data.transferId!;
                          optionsdynamic.gettimeSlots();
                        }
                      },
                      children: [
                        Obx(
                              () => optionsdynamic.dynamicWidgets.isEmpty
                              ? Text('Loading...')
                              : Column(
                            children: optionsdynamic.dynamicWidgets,
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      if (controller.loggedIn.value == true) {
                        // User is logged in
                        return InlineFlexButton(
                          label: "Add to Cart",
                          onPressed: () {
                            var value = UpdateCartTourDetail(
                                tourname: "hello",
                                tourOption: data.transferName!,
                                tourId: data.tourId!,
                                optionId: data.tourOptionId!,
                                adult: optionsdynamic.adultsSelectedValue.value,
                                child:
                                optionsdynamic.childrenSelectedValue.value,
                                infant:
                                optionsdynamic.infantsSelectedValue.value,
                                tourDate: optionsdynamic.selectedDate.value
                                    .toString()
                                    .substring(0, 10),
                                timeSlotId: optionsdynamic.timeSlotId.value,
                                startTime: data.startTime!,
                                transferId: data.transferId!,
                                adultRate: data.adultPrice!.toDouble(),
                                childRate: data.childPrice?.toDouble() ?? 0.0,
                                serviceTotal: data?.finalAmount ?? 0.0,
                                cartId: controller.cartId.value);
                            print(controller.cartId.value);
                            print(value.tourOption);
                            print(value.tourname);
                            print(value.tourDate);
                            print(value.startTime);
                            print(value.pickup);
                            optionsdynamic.Addtocart(value);
                            print(value.childRate);
                          },
                        );
                      } else {
                        // User is not logged in
                        return InlineFlexButton(
                          label: "Login",
                          onPressed: () {
                            Get.toNamed('/Login');
                          },
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ): Text("No Options Available");
  }
}
