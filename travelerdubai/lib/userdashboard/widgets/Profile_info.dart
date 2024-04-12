import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../auth/usersdatalayer/repository/user_repository.dart';
import '../../auth/usersdatalayer/service/create_user_remote.dart';
import '../../auth/usersdatalayer/usecase/get_user_details.dart';
import '../../bookings/data_layer/repository/bookings_repository.dart';
import '../../bookings/data_layer/service/booking_remote.dart';
import '../../bookings/data_layer/usecase/userbookings_usecase.dart';
import '../dashboard_controller.dart';
import 'accountinfo.dart';
import 'edit_Form.dart';

class ProfileInfo extends StatelessWidget {
  final DashBoardController accountController = Get.put(
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

  @override
  Widget build(BuildContext context) {


    return Container(
      width: Get.width,
      height: Get.height ,
      child: Flex(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Get.width>1000 ? Axis.horizontal:Axis.vertical,
        children: [
          Flexible(
            flex: Get.width>600?2:5,
            child: Obx(() {
              return accountController.isEditMode.value
                  ? EditForm() // Display edit form when in edit mode
                  :  AccountInfo(); // Display account info by default
            }),
      ),
          Flexible(
              flex:1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    child: Obx(()=> InlineFlexButton(label: accountController.islabel.value, onPressed: () {

                      accountController.toggleEditMode();}, hpadding: Get.width*0.03,vpadding: Get.height*0.02,borderwidth: 1,textcolor: colorblack,)),
                  ),
                ],
              ))
         
        ],
      ),
    );

  }



}



