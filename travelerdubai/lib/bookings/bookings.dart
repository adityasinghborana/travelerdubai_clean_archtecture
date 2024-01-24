import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/bookings/bookings_controller.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookingController controller = Get.put(BookingController());
    return Center(
      child: Text("${controller.status}"),
    );
  }
}
