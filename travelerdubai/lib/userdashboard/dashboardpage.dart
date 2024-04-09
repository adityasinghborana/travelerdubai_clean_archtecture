import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';
import 'package:travelerdubai/userdashboard/widgets/booking_list.dart';

class DashboardPage extends StatelessWidget {
  final DashBoardController controller = Get.put(DashBoardController());
  ValueNotifier<int> transparentTabIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: Height,
        decoration: BoxDecoration(gradient: backgroundgradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorwhite,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.15,
                        child: Flexible(
                          flex: 1,
                          child: TabBar(
                            labelColor: colorwhite,
                            indicator: BoxDecoration(
                              color:
                                  colorMediumBlue, // Set the color of the indicator
                              borderRadius: BorderRadius.circular(
                                  8.0), // Set the border radius to give rounded corners
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(text: "Account"), // First tab
                              Tab(text: "Tab 2"), // Second tab
                              // Add more tabs as needed
                            ],
                            onTap: (index) {
                              transparentTabIndexNotifier.value = index;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: transparentTabIndexNotifier,
                    builder: (context, tIndex, child) {
                      Widget contentWidget;
                      switch (tIndex) {
                        case 0:
                          contentWidget =
                              ProfileInfo(); // Replace with your actual widget for the first tab
                          break;
                        case 1:
                          contentWidget =
                              const BookingsList(); // Replace with your actual widget for the second tab
                          break;
                        // Add more cases for other tab indexes as needed
                        default:
                          contentWidget =
                              const BookingsList(); // Default to an empty container if index is out of range
                      }
                      return contentWidget;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
