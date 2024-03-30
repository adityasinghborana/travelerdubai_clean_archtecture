import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/ui_state.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/update_cart.dart';
import '../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../timeslot_data_layer/service/timslot_remote.dart';
import '../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../tour_options_controller.dart';
import 'button.dart';

Widget options() {
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

  return Obx(() {
    var output = optionsstatic.options.value;
    var output1 = optionsstatic.dynamicoptions.toList();
    switch (output.state) {
      case UiState.SUCCESS:
        return SizedBox(
          height: 90,
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: optionsstatic.options.value.data?.length,
            itemBuilder: (BuildContext context, int index) {
              List<RxBool> showChanged = List.generate(
                  optionsstatic.options.value.data!.length,
                  (index) => false.obs);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            "${optionsstatic.options.value.data?[index].optionName}"),
                        Obx(() {
                          if (optionsstatic.dateTextController.value.text !=
                              '') {
                            return Text(
                              "Price is${output1[index].finalAmount}",
                            );
                          } else {
                            return const Text(
                                ""); // Return an empty Text widget if dateTextController is empty
                          }
                        }), // SizedBox(
                        //   height: 300,
                        //   width: 450,
                        //   child: Optionpricing(),
                        // ),
                        InlineFlexButton(
                          label: 'Get Price',
                          onPressed: () async {
                            optionsstatic.getOptionsdynamicData();
                          },
                        )
                      ],
                    ),
                  ],
                ),
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
