import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';

import 'format_date.dart';

class PopupCard extends StatelessWidget {
  final TourOptionStaticDataController static = Get.find();

  PopupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('static controller in pop up is$static');
    final List<dynamic> args = Get.arguments;
    final List<Result> lst = static.timeslots.value
        .firstWhere((ts) => ts[0].tourOptionId == args[1],
            orElse: () => [])
        .toList();
    print('Curr option id is ${args[1]}');
    //final int index = args[1] as int;
    //print('index is $index');
    var selectedValue = lst.isNotEmpty
        ? lst[0].obs
        : Result(
                tourOptionId: 0,
                timeSlotId: '',
                timeSlot: '',
                available: 0,
                adultPrice: 0,
                childPrice: 0,
                isDynamicPrice: false,
                companyBuyingPriceDynamic: 0)
            .obs;

    return Obx(
        ()=> Stack(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          IconButton(
                            onPressed: () {
                              // Add your close logic here
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          )
                        ],
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
                            formatDate(static.dateTextController.value.text ??
                                '2024-03-16'),
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
                        //width: MediaQuery.of(context).size.width * .50,
                        height: MediaQuery.of(context).size.width * .50,
                        child: ListView.builder(
                            itemCount: lst.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Row(
                                          children: [
                                            Radio<String>(
                                              value: lst[i].timeSlotId.toString(),
                                              groupValue: selectedValue
                                                  .value.timeSlotId
                                                  .toString(),
                                              onChanged: (value) =>
                                                  selectedValue.value = lst[i],
                                            ),
                                            Text(
                                              lst[i].timeSlot,
                                              style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .04,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Availability :',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF828282),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          Text(
                                            lst[i].available.toString(),
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Color(0xFF828282),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * .05,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
