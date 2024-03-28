import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/constants/contants.dart';

import '../../checkout/presentation/checkout_controller.dart';

class PaymentSuccess extends StatelessWidget {
  final CheckoutController cc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Expanded(
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return Desktop();
            }
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              return Mobile();
            }


            else {
              return Mobile();
            }
          }
        )));
  }

Widget Mobile(){
  return Container(
    decoration: BoxDecoration(gradient: backgroundgradient),
    child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../assets/successmobile.png',
          ),
          Center(
            child: Text(
              "YourBooking is successful Your Reference no is ${cc.refno.value} "),


          ),
        ],
      ),
    ),
  );
}

Widget Desktop (){
  return Container(
    decoration: BoxDecoration(gradient: backgroundgradient),
    child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../assets/success.png',
          ),
          Center(
            child: Text(
             "YourBooking is successful Your Reference no is ${cc.refno.value} "),


          ),
        ],
      ),
    ),
  );
}
}
