import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../timeslot_data_layer/models/response/timeslot_response.dart';
import '../tour_options_controller.dart';

class TimeDropdownWidget extends StatelessWidget {
  final int tourOptionId;
  final TourOptionStaticDataController optionsStatic = Get.find();

  TimeDropdownWidget({Key? key, required this.tourOptionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (optionsStatic.timeslots.isNotEmpty) {
        // Filter timeslots based on tourOptionId
        var filteredTimeSlots = optionsStatic.timeslots.value
            .firstWhere((ts) => ts[0].tourOptionId == tourOptionId, orElse: () => [])
            .toList();

        return Expanded(
          child: Container(
            width: 148,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration.collapsed(hintText: 'Time Slot'),
                onChanged: (String? selectedValue) {
                  optionsStatic.changeTimeSlotId(int.parse(selectedValue ?? "0"));
                },
                items: filteredTimeSlots.map<DropdownMenuItem<String>>(
                      (timeslot) {
                    return DropdownMenuItem<String>(
                      value: timeslot.timeSlotId.toString(),
                      child: Text(timeslot.timeSlot),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      } else {
        return const Flexible(
          flex: 1,
          child: Text("No timeslot required"),
        );
      }
    });
  }
}




