
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/checkout/presentation/Screens/desktop/checkout.dart';
import 'package:travelerdubai/checkout/presentation/Screens/mobile/checkout_screen_mobile.dart';
class Checkout extends StatelessWidget {

  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop ) {
            return CheckoutScreenDesktop();
          }
          
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile||
          sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return CheckoutScreenMobile();
          } else {
            return CheckoutScreenMobile();
          }
        },
      ),
    );
  }
}