import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';

Widget OrderSumary(String totalprice) {
  return Container(
padding: EdgeInsets.all(Get.height*0.03),
    child:
        Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Text("Total"),
          Text(totalprice),
        ]),
     
  );
}
