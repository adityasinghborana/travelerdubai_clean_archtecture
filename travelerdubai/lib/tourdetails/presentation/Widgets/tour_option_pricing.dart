import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../timeslot_data_layer/service/timslot_remote.dart';
import '../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../tour_options_controller.dart';

class Optionpricing extends StatelessWidget {
  final TouroptionstaticdataController optionsdynamic = Get.put(
    TouroptionstaticdataController(
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
    ),
  );

  final HeaderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: optionsdynamic.dynamicoptions.length,
      itemBuilder: (BuildContext context, int index) {
        final data = optionsdynamic.dynamicoptions[index];
        return Container(
          child: Column(
            children: [
              Text("${data.tourOptionId}"),
              Text("${data.transferName}"),
              Text(
                  "Amount ${optionsdynamic.pricing.value.addPriceAdult}+${data.adultPrice}"),
              Text("data${data.tourId}"),
              Text("data${optionsdynamic.infantsSelectedValue}"),
              Text("data${optionsdynamic.adultsSelectedValue}"),
              Text("data${optionsdynamic.childrenSelectedValue}"),
              Text("data${optionsdynamic.selectedDate}"),
              Text("data${data.startTime}"),
              Text("data${data.transferId}"),
              Text("data${data.adultPrice}"),
              Text("data${data.childPrice}"),
              Text("data${data.infantPrice}"),
              Text("data${data.finalAmount}"),
              Text("data${"timeslotid"}"),
              Obx(() {
                if (controller.loggedin.value == true) {
                  // User is logged in
                  return InlineFlexButton(
                    label: "Add to Cart",
                    onPressed: () {
                      print("hello");
                    },
                  );
                } else {
                  // User is not logged in
                  return InlineFlexButton(
                    label: "Login",
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                  );
                }
              }),
            ],
          ),
        );
      },
    );
  }
}
