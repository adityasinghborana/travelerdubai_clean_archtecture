import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:travelerdubai/Components/Advertisement.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';
import 'package:travelerdubai/auth/usersdatalayer/service/create_user_remote.dart';
import 'package:travelerdubai/bookings/data_layer/repository/bookings_repository.dart';
import 'package:travelerdubai/bookings/data_layer/service/booking_remote.dart';
import 'package:travelerdubai/bookings/data_layer/usecase/userbookings_usecase.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';
import 'package:travelerdubai/userdashboard/widgets/booking_list.dart';

import '../auth/usersdatalayer/usecase/get_user_details.dart';
import '../core/widgets/header.dart';

class DashboardPage extends StatelessWidget {

  final DashBoardController controller = Get.put(
    DashBoardController(
      GetUserBookingsUseCase(
        BookingsRepositoryImpl(
          BookingsRemoteService(Dio()),
        ),
      ),
      GetUserDetailsUseCase(
        UserRepositoryImpl(createUserRemoteService(Dio()),),),
    ),
  );

  ValueNotifier<int> transparentTabIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double Height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Header(),
                  Container(

                    decoration: BoxDecoration(gradient: backgroundgradient),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(
                          vertical: 50, horizontal: Get.width * 0.12),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Height * .06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorwhite,
                              ),
                              margin: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Height * .5,
                                    width: Get.width * 0.15,
                                    child: TabBar(
                                      labelColor: colorwhite,
                                      indicator: BoxDecoration(
                                        color: colorMediumBlue,
                                        // Set the color of the indicator
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius to give rounded corners
                                      ),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      tabs: [
                                        Tab(text: "Account"), // First tab
                                        Tab(text: "Bookings"), // Second tab
                                        // Add more tabs as needed
                                      ],
                                      onTap: (index) {
                                        transparentTabIndexNotifier.value =
                                            index;
                                      },
                                    ),
                                  ),
                                ],

                              ),
                            ),
                            Container(
                              height: Height * 0.5,
                              child: ValueListenableBuilder<int>(
                                valueListenable: transparentTabIndexNotifier,
                                builder: (context, tIndex, child) {
                                  Widget contentWidget;
                                  switch (tIndex) {
                                    case 0:
                                      contentWidget = Container(
                                          height: Height,
                                          child:
                                          ProfileInfo()); // Replace with your actual widget for the first tab
                                      break;
                                    case 1:
                                      contentWidget =
                                          BookingsList(); // Replace with your actual widget for the second tab
                                      break;
                                  // Add more cases for other tab indexes as needed
                                    default:
                                      contentWidget = Container(
                                          height: Height,
                                          child:
                                          BookingsList()); // Default to an empty container if index is out of range
                                  }
                                  return contentWidget;
                                },
                              ),
                            ),
                            advertisement(subHeadingfontsize: Get.width * 0.015,
                                Headingfontsize: Get.width * 0.035,
                                decoration: BoxDecoration()),
                          ],
                        ),
                      ),

                    ),

                  ),
                ])
        ));
  }
}
