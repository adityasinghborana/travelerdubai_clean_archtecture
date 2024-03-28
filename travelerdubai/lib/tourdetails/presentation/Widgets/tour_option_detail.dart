import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/show_date_picker.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_pricing.dart';
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
import 'dropdown_widget.dart';

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

  return Container(
    height: 300,
    width: Get.width * .85,
    child: ListView.builder(
      itemCount: optionsstatic.options.length,
      itemBuilder: (BuildContext context, int index) {
        List<RxBool> showChanged =
            List.generate(optionsstatic.options.length, (index) => false.obs);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${optionsstatic.options[index].optionName}"),
                  Obx(() => DropdownWidget(
                        label: 'Adults',
                        selectedValue: optionsstatic.adultsSelectedValue.value,
                        onChanged: (value) => optionsstatic
                            .adultsSelectedValue.value = value ?? 1,
                      )),
                  Obx(() => DropdownWidget(
                        label: 'Children',
                        selectedValue:
                            optionsstatic.childrenSelectedValue.value,
                        onChanged: (value) => optionsstatic
                            .childrenSelectedValue.value = value ?? 0,
                      )),
                  Obx(() => DropdownWidget(
                        label: 'Infants',
                        selectedValue: optionsstatic.infantsSelectedValue.value,
                        onChanged: (value) => optionsstatic
                            .infantsSelectedValue.value = value ?? 0,
                      )),
                  Showdatepicker(),
                  Obx(() {
                    if (showChanged[index].value == true) {
                      return Container(
                          height: 300, width: 450, child: Optionpricing());
                    } else {
                      return InlineFlexButton(
                        label: 'Get Price',
                        onPressed: () async {
                          optionsstatic.getOptionsdynamicData();
                        },
                      );
                    }
                  }),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}
