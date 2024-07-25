import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../../../Components/custom_button.dart';
import '../../../../../Components/format_date.dart';
import '../../../../../core/controller/headercontroller.dart';
import '../../../../timeslot_data_layer/models/response/timeslot_response.dart';
import '../../../tour_options_controller.dart';


class TimeSlots extends StatefulWidget {
  @override
  _TimeSlotsState createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  late Rx<Result> selectedValue;
  late List<Result> lst;

  @override
  void initState() {
    super.initState();
    final TourOptionStaticDataController static = Get.find();
    lst = static.timeslots.value
        .firstWhere((ts) => ts[0].tourOptionId == static.currOptionId, orElse: () => [])
        .toList();
    selectedValue = (lst.isNotEmpty
        ? lst[0]
        : Result(
      tourOptionId: 0,
      timeSlotId: '',
      timeSlot: '',
      available: 0,
      adultPrice: 0,
      childPrice: 0,
    )).obs;
  }

  @override
  Widget build(BuildContext context) {
    final TourOptionStaticDataController static = Get.find();
    final HeaderController controller = Get.find();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 10),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(height: 1.0),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDate(static.dateTextController.value.text),
                    style: TextStyle(
                      color: const Color(0xFF1C1C1C),
                      fontSize: Get.width * .035,
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
                      fontSize: Get.width * .035,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              if (lst.isNotEmpty)
                SizedBox(
                  height: Get.width * .40,
                  child: ListView.builder(
                    itemCount: lst.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                    () => Row(
                                  children: [
                                    Radio<String>(
                                      value: lst[i].timeSlotId.toString(),
                                      groupValue: selectedValue.value.timeSlotId.toString(),
                                      onChanged: (value) {

                                        selectedValue.value = lst[i];
                                        static.changeTimeSlotId(int.parse(selectedValue.value.timeSlotId));
                                      },
                                    ),
                                    Text(
                                      lst[i].timeSlot,
                                      style: TextStyle(
                                        color: const Color(0xFF828282),
                                        fontSize: MediaQuery.of(context).size.width * .04,
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
                          SizedBox(height: Get.width * .05),
                        ],
                      );
                    },
                  ),
                )
              else
                Center(child: Text("Loading")),
              if (lst.isNotEmpty && controller.loggedIn.isTrue)
                Center(
                  child: SizedBox(
                    width: Get.width * .55,
                    child: ButtonView(
                      borderColor: Colors.transparent,
                      btnName: 'Add to Cart',
                      bgColor: colorMediumBlue,
                      onButtonTap: () {


                        static.value.timeSlotId = int.parse(selectedValue.value.timeSlotId);
                      static.Addtocart(static.value);
                      },
                    ),
                  ),
                )
              else
                Container(),
            ],
          ),

      ),
    );
  }
}
