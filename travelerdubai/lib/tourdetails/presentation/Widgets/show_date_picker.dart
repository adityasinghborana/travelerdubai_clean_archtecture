
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';

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

class Showdatepicker  extends StatelessWidget {
  final TouroptionstaticdataController controller = Get.put(
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
        GetTimeSlotUseCase(TimeSlotRepositoryImpl(TimeSlotRemoteService(Dio()))),UpdateCartUseCase(CartRepositoryImpl(CartRemoteService(Dio()),),)

    ),
  );
  final TourController tourController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () async {

              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate:  DateTime.now().add(Duration(hours: tourController.tour.value.cutOffhrs ?? 0)),
                firstDate: DateTime.now().add(Duration(hours: tourController.tour.value.cutOffhrs??0)),
                lastDate: DateTime.now().add(Duration(days: 6 * 30)),
              );

              if (pickedDate != null && pickedDate != controller.selectedDate.value) {
                controller.selectedDate.value = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                );}


              },

            child: Text('Pick a Date'),
          ),
        ],
      ),
    );
  }
}