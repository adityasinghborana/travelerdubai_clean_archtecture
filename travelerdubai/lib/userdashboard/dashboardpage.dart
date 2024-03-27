import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
import 'package:travelerdubai/userdashboard/widgets/Information_widget.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';
import 'package:travelerdubai/userdashboard/widgets/booking_list.dart';

class DashboardPage extends StatelessWidget {
  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
        height: Height,
        decoration: BoxDecoration(gradient: backgroundgradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              InfoWidget(widget: ProfileInfo(), height: Height, width: width,title: "Account",),
              InfoWidget(widget: Container(height:900,child: BookingsList()), height: Height, width: width,title: "Bookings",),
              advertisement(subHeadingfontsize: 28, Headingfontsize: 54)
            ],
          ),
        ),
      ),
    );
  }
}
