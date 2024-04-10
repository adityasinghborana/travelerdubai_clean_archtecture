


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/user_detail_response.dart';
import 'package:travelerdubai/core/State/Data_Not_Found.dart';
import 'package:travelerdubai/userdashboard/dashboard_controller.dart';

import '../../auth/usersdatalayer/repository/user_repository.dart';
import '../../auth/usersdatalayer/service/create_user_remote.dart';
import '../../auth/usersdatalayer/usecase/get_user_details.dart';
import '../../bookings/data_layer/repository/bookings_repository.dart';
import '../../bookings/data_layer/service/booking_remote.dart';
import '../../bookings/data_layer/usecase/userbookings_usecase.dart';
import '../../core/constants/constants.dart';

class AccountInfo extends StatelessWidget {
  AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashBoardController dashBoardController = Get.put(
      DashBoardController(
        GetUserBookingsUseCase(
          BookingsRepositoryImpl(
            BookingsRemoteService(Dio()),
          ),
        ),
        GetUserDetailsUseCase(
          UserRepositoryImpl(createUserRemoteService(Dio())),
        ),
      ),
    );

    // Check if userDetails list is empty or null

    // Access the first element of userDetails list
    Rx<UserDetail> details = dashBoardController.userDetails[0].obs;
    // if (dashBoardController.isLoading.value == true) {
    //   return dataNotFound(width: 400, height: 200); // Display data not found widget
    // }
final EdgeInsets padding = EdgeInsets.all(20);
    return Obx(
            () {
          if (dashBoardController.isLoading.isTrue) {
            return dataNotFound(width: 400, height: 200);
          }

          else {
           return  Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: padding,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                            color: colorwhite
                        ),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${details.value.username}"),
                      ),
                    ),
                    SizedBox(width: 40),
                    // Adjust spacing between text form fields
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                          color: colorwhite
                        ),
                        padding: padding,

                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${details.value.email}"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: padding,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                            color: colorwhite
                        ),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                            "${details.value.dob?.toString().substring(0, 10) ??
                                'N/A'}"),
                      ),
                    ),
                    SizedBox(width: 40),
                    // Adjust spacing between text form fields
                    Expanded(
                      child: Container(padding: padding,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                            color: colorwhite
                        ),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${details.value.uid}"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: padding,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                            color: colorwhite
                        ),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${details.value.age}"),
                      ),
                    ),
                    SizedBox(width: 40),
                    // Adjust spacing between text form fields
                    Expanded(
                      child: Container(
                        padding: padding,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorlightgrey.withOpacity(0.5),width: 1),
                            color: colorwhite
                        ),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${details.value.address ?? 'N/A'}"),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        }
    );
  }

}
