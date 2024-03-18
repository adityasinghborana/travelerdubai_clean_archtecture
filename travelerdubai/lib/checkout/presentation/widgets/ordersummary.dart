import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';

Widget OrderSumary(String totalprice) {
  return Container(
    height: 300,
    width: 300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(height: 200, width: 200, child: ProductList()),
        Row(children: <Widget>[
          Text("TotalPrice"),
           Text(totalprice),
        ]),

        // Add widgets for displaying order items and total amount

        SizedBox(height: 20),
      ],
    ),
  );
}
