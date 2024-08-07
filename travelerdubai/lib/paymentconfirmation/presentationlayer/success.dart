import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../Components/header.dart';
import '../../checkout/presentation/checkout_controller.dart';

class PaymentSuccess extends StatelessWidget {

 // final CheckoutController cc = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  Get.width<1000 ? MobileHeader(context: context):null,
        body:ResponsiveBuilder(builder: (context, sizingInformation) {
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
                ));
  }

Widget Mobile( ){
  return Container(
    width: Get.width,
    decoration: BoxDecoration(gradient: backgroundgradient),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(

          images.paymentsucess
        ),
        Center(
          child: Text(
            "YourBooking is successful Your Reference no is "
               // "${cc.refno.value} "
          ),

        ),
      ],
    ),
  );
}

Widget Desktop (){
  return Container(

    decoration: BoxDecoration(gradient: backgroundgradient),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(
          images.paymentsucessdesktop
        ),
        Center(
          child: Text(
           "YourBooking is successful Your Reference no is "
              // "${cc.refno.value}"

          ),


        ),
      ],
    ),
  );
}
}
