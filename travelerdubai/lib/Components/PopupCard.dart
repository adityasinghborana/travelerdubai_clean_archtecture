import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';

import '../Cart/data_layer/repository/cart_repository.dart';
import '../Cart/data_layer/service/cart_remote.dart';
import '../Cart/data_layer/usecase/update_cart.dart';
import '../tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import '../tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import '../tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../tourdetails/touroption_data_layer/remote/service/touroption_remote.dart';
import '../tourdetails/touroption_data_layer/repository/tour_option_repository.dart';
import '../tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../tourdetails/touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import 'format_date.dart';

class PopupCard extends StatelessWidget {
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

  PopupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args = Get.arguments;
    final List<Result> lst = args[0] as List<Result>;
    //final int index = args[1] as int;
    //print('index is $index');
    var selectedValue = lst[0].obs;

    return Stack(
      children: <Widget>[
        // Background with semi-transparent color
        Container(
          color: Colors.black.withOpacity(0.5),
          // You can adjust the opacity value to your preference
        ),
        // Card widget
        Center(
          child: Card(
            margin: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .80,
              height: MediaQuery.of(context).size.width * .90,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Select Time Slot',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(
                      height: 1.0,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDate(
                              static.dateTextController.value.text == null
                                  ? static.dateTextController.value.text
                                  : '2024-03-16'),
                          style: TextStyle(
                            color: const Color(0xFF1C1C1C),
                            fontSize: MediaQuery.of(context).size.width * .035,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Availability',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF1C1C1C),
                            fontSize: MediaQuery.of(context).size.width * .035,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .50,
                      height: MediaQuery.of(context).size.width * .50,
                      child: ListView.builder(
                          itemCount: lst.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: lst[i].timeSlotId.toString(),
                                          groupValue: selectedValue.value?.timeSlotId.toString(),
                                          onChanged: (value) => selectedValue.value = lst[i],
                                        ),
                                        Text(
                                          lst[i].timeSlot,
                                          style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: MediaQuery.of(context).size.width * .04,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width * .05,),
                              ],
                            );
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
