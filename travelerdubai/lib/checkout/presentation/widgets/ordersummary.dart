import 'package:flutter/cupertino.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';

Widget OrderSumary ( int totalprice){

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Order Summary',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
      ),
      ProductList(),
      Row(
        children: <Widget>[Text("TotalPrice"),Text("$totalprice")],
      ),

      // Add widgets for displaying order items and total amount

      SizedBox(height: 20),
    ],
  );
}