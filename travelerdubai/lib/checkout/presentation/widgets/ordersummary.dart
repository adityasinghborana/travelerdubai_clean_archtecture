import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

Widget OrderSumary(String totalPrice) {
  return Container(
    padding: EdgeInsets.all(Get.height * 0.03),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           Text("Total",style: bodyBlack(Get.context!).copyWith(fontWeight: FontWeight.bold),),
          Text("AED $totalPrice",style: bodyBlack(Get.context!).copyWith(fontWeight: FontWeight.bold),),
        ]),
  );
}
