// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../timeslot_data_layer/models/response/timeslot_response.dart';
// import '../tour_options_controller.dart';
//
// class TimeDropdownWidget extends StatelessWidget {
//   RxList<Result> timeSlotList = <Result>[].obs;
//   final TourOptionStaticDataController optionsStatic = Get.find();
//
//   TimeDropdownWidget({Key? key, required this.timeSlotList}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (optionsStatic.timeslots.isNotEmpty) {
//         var timeSlotMap = timeSlotList.isNotEmpty
//             ? Map.fromEntries(timeSlotList.map((entry) => MapEntry(entry.timeSlotId!, entry.timeSlot!)))
//             : {
//           '1': '1hr',
//           '2': '2hr',
//           '3': '3hr',
//           '4': '4hr',
//         }; // Example values as fallback
//
//         return Expanded(
//           child: Container(
//             width: 148,
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                 side: const BorderSide(
//                     width: 1, color: Color(0xFFD9D9D9)),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: DropdownButtonFormField<String>(
//                 decoration: const InputDecoration.collapsed(hintText: 'Time Slot'),
//                 onChanged: (String? selectedValue) {
//
//
//                  optionsStatic.changeTimeSlotId(selectedValue);
//                 },
//                 items: timeSlotMap.entries.map<DropdownMenuItem<String>>(
//                       (entry) {
//                     return DropdownMenuItem<String>(
//                       value: '${entry.key}',
//                       child: Text(' ${entry.value}-${entry.key} '.toString().split('-')[0]),
//                     );
//                   },
//                 ).toList(),
//               ),
//             ),
//           ),
//         );
//       } else {
//         return const Flexible(
//           flex: 1,
//           child: Text("No timeslot required"),
//         );
//       }
//     });
//   }
// }
//
//
//
