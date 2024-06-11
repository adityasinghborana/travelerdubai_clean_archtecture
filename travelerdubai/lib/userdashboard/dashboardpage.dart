import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/Components/footer_mobile.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/Components/footer.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';
import 'package:travelerdubai/userdashboard/widgets/booking_list.dart';

import '../Components/header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> transparentTabIndexNotifier = ValueNotifier<int>(0);
    final double height = MediaQuery.of(context).size.height;
    final ScrollController controller = ScrollController();
    return Scaffold(
        body: SingleChildScrollView(
            controller: controller,
            child: Column(children: [
              Get.width > 1000
                  ? Header()
                  : MobileHeader(
                      context: context,
                    ),
              Container(
                decoration: BoxDecoration(gradient: backgroundgradient),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 50, horizontal: Get.width / 10),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * .06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorwhite,
                          ),
                          margin:
                              EdgeInsets.symmetric(vertical: Get.height * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * .5,
                                width: Get.width > 1000
                                    ? Get.width * 0.2
                                    : Get.width * 0.8,
                                child: TabBar(
                                  labelColor: colorwhite,
                                  indicator: BoxDecoration(
                                    color: colorMediumBlue,
                                    // Set the color of the indicator
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Set the border radius to give rounded corners
                                  ),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: const [
                                    Tab(text: "Account"), // First tab
                                    Tab(text: "Bookings"), // Second tab
                                    // Add more tabs as needed
                                  ],
                                  onTap: (index) {
                                    transparentTabIndexNotifier.value = index;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.5,
                          child: ValueListenableBuilder<int>(
                            valueListenable: transparentTabIndexNotifier,
                            builder: (context, tIndex, child) {
                              Widget contentWidget;
                              switch (tIndex) {
                                case 0:
                                  contentWidget = SizedBox(
                                      height: height,
                                      child:
                                          ProfileInfo()); // Replace with your actual widget for the first tab
                                  break;
                                case 1:
                                  contentWidget =
                                      BookingsList(); // Replace with your actual widget for the second tab
                                  break;
                                // Add more cases for other tab indexes as needed
                                default:
                                  contentWidget = SizedBox(
                                      height: height,
                                      child:
                                          BookingsList()); // Default to an empty container if index is out of range
                              }
                              return contentWidget;
                            },
                          ),
                        ),
                        advertisement(
                            subHeadingfontsize: Get.width * 0.015,
                            Headingfontsize: Get.width * 0.035,
                            decoration: BoxDecoration()),
                      ],
                    ),
                  ),
                ),
              ),
              Get.width > 1000 ? buildFooter() : buildFooterMobile()
            ])));
  }
}
