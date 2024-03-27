import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: ExpansionTile(
                  leading: Icon(Icons.arrow_drop_down),
                  trailing: null,
          
                  tilePadding: EdgeInsets.zero,
                  // Optionally set padding to zero
                  collapsedIconColor: Colors.black,
                  // Set the color of the collapsed icon
                  title: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 8), // Adjust spacing as needed
                              Text("Account"),
                            ],
                          ),
                          InlineFlexButton(
                            label: "Save",
                            bgcolor: Colors.blue,
                            onPressed: () => print("hello"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  children: [
                    // Content that will be displayed when the tile is expanded
                    ProfileInfo(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: ExpansionTile(
                  leading: Icon(Icons.arrow_drop_down),
                  trailing: null,
          
                  tilePadding: EdgeInsets.zero,
                  // Optionally set padding to zero
                  collapsedIconColor: Colors.black,
                  // Set the color of the collapsed icon
                  title: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 8), // Adjust spacing as needed
                              Text("Bookings"),
                            ],
                          ),
                          InlineFlexButton(
                            label: "Save",
                            bgcolor: Colors.blue,
                            onPressed: () => print("hello"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  children: [
                    // Content that will be displayed when the tile is expanded
                    ProfileInfo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
