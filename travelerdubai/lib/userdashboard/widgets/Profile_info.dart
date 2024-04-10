import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../dashboard_controller.dart';
import 'accountinfo.dart';
import 'edit_Form.dart';

class ProfileInfo extends StatelessWidget {
  final DashBoardController accountController = Get.find();
  final TextEditingController namecontrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
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



