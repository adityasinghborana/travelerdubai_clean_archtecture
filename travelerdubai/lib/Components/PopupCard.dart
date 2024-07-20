// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travelerdubai/core/constants/constants.dart';
// import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
// import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';
//
// import '../core/controller/headercontroller.dart';
// import 'custom_button.dart';
// import 'format_date.dart';
//
// class PopupCard extends StatelessWidget {
//   final TourOptionStaticDataController static = Get.find();
//   final HeaderController controller = Get.find();
//
//   PopupCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final TourOptionStaticDataController static = Get.find();
//     final HeaderController controller = Get.find();
//     print('static controller in pop up is$static');
//     final List<Result> lst = static.timeslots.value
//         .firstWhere((ts) => ts[0].tourOptionId == static.currOptionId,
//             orElse: () => [])
//         .toList();
//     print('Curr option id is ${static.currOptionId}');
//     //final int index = args[1] as int;
//     //print('index is $index');
//     var selectedValue = lst.isNotEmpty
//         ? lst[0].obs
//         : Result(
//             tourOptionId: 0,
//             timeSlotId: '',
//             timeSlot: '',
//             available: 0,
//             adultPrice: 0,
//             childPrice: 0,
//           ).obs;
//
//     return Obx(
//       () => Stack(
//         children: <Widget>[
//           // Background with semi-transparent color
//           Container(
//             color: Colors.black.withOpacity(0.5),
//             // You can adjust the opacity value to your preference
//           ),
//           // Card widget
//           Center(
//             child: Card(
//               margin: const EdgeInsets.all(30.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * .80,
//                 height: MediaQuery.of(context).size.width * 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Select Time Slot',
//                             style: TextStyle(
//                               color: Color(0xFF828282),
//                               fontSize: 16,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w600,
//                               height: 0,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               // Add your close logic here
//                               Navigator.of(context).pop();
//                             },
//                             icon: const Icon(Icons.close),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10.0),
//                       const Divider(
//                         height: 1.0,
//                       ),
//                       const SizedBox(height: 10.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             formatDate(static.dateTextController.value.text),
//                             style: TextStyle(
//                               color: const Color(0xFF1C1C1C),
//                               fontSize:
//                                   MediaQuery.of(context).size.width * .035,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                           Text(
//                             'Availability',
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               color: const Color(0xFF1C1C1C),
//                               fontSize:
//                                   MediaQuery.of(context).size.width * .035,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           )
//                         ],
//                       ),
//                       if (lst.isNotEmpty)
//                         SizedBox(
//                           //width: MediaQuery.of(context).size.width * .50,
//                           height: MediaQuery.of(context).size.width * .40,
//                           child: ListView.builder(
//                               itemCount: lst.length,
//                               itemBuilder: (context, i) {
//                                 return Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Obx(
//                                           () => Row(
//                                             children: [
//                                               Radio<String>(
//                                                 value: lst[i]
//                                                     .timeSlotId
//                                                     .toString(),
//                                                 groupValue: selectedValue
//                                                     .value.timeSlotId
//                                                     .toString(),
//                                                 onChanged: (value) =>
//                                                     selectedValue.value =
//                                                         lst[i],
//                                               ),
//                                               Text(
//                                                 lst[i].timeSlot,
//                                                 style: TextStyle(
//                                                   color:
//                                                       const Color(0xFF828282),
//                                                   fontSize:
//                                                       MediaQuery.of(context)
//                                                               .size
//                                                               .width *
//                                                           .04,
//                                                   fontFamily: 'Roboto',
//                                                   fontWeight: FontWeight.w400,
//                                                   height: 0,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             const Text(
//                                               'Availability :',
//                                               textAlign: TextAlign.right,
//                                               style: TextStyle(
//                                                 color: Color(0xFF828282),
//                                                 fontSize: 14,
//                                                 fontFamily: 'Roboto',
//                                                 fontWeight: FontWeight.w400,
//                                                 height: 0,
//                                               ),
//                                             ),
//                                             Text(
//                                               lst[i].available.toString(),
//                                               textAlign: TextAlign.right,
//                                               style: const TextStyle(
//                                                 color: Color(0xFF828282),
//                                                 fontSize: 14,
//                                                 fontFamily: 'Roboto',
//                                                 fontWeight: FontWeight.w400,
//                                                 height: 0,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           MediaQuery.of(context).size.width *
//                                               .05,
//                                     ),
//                                   ],
//                                 );
//                               }),
//                         )
//                       else
//                         Center(child: Text("Loading")),
//                       if (lst.isNotEmpty && controller.loggedIn.isTrue)
//                         Center(
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width * .55,
//                             child: ButtonView(
//                               borderColor: Colors.transparent,
//                               btnName: 'Add to Cart',
//                               bgColor: colorMediumBlue,
//                               onButtonTap: () {
//                                 print(
//                                     'selected timeslot id is ${selectedValue.value.timeSlot}');
//                                 static.value.timeSlotId =
//                                     int.parse(selectedValue.value.timeSlotId);
// print(static.transferId.value);
//                                 static.Addtocart(static.value);
//                                 print(static.value.toJson());
//                               },
//                             ),
//                           ),
//                         )
//                       else
//                         Container(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
