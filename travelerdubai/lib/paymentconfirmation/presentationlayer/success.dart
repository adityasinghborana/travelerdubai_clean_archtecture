import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../checkout/presentation/checkout_controller.dart';

class PaymentSuccess extends StatelessWidget {
  final CheckoutController cc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("YourBooking is successful Your Reference no is ${cc.refno.value} "),),
    );
  }
}
