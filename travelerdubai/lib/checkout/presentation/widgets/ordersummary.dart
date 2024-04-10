import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';

Widget OrderSumary(String totalprice) {
  return Container(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [




        // Add widgets for displaying order items and total amount

        SizedBox(height: 20),
        Row(children: <Widget>[
          Text("TotalPrice"),
          Text(totalprice),
        ]),
      ],
    ),
  );
}
