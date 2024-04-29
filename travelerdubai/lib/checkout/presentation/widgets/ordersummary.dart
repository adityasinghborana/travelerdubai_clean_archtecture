import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget OrderSumary(String totalPrice) {
  return Container(
    padding: EdgeInsets.all(Get.height * 0.03),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Total"),
          Text(totalPrice),
        ]),
  );
}
