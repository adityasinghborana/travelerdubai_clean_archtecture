import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/widgets/Mobileheader.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double Height = MediaQuery.of(context).size.height;
    final double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MobileHeader(),
      body: Container(
        decoration: BoxDecoration(gradient: backgroundgradient),
        child: Expanded(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return Desktop(Height, Width);
              }
              if (sizingInformation.deviceScreenType == DeviceScreenType.mobile||
                  sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                return Mobile(Height, Width);
              }
              else{
                return Mobile(Height, Width);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget Mobile(double height, double width) {
    return Image.asset(
      '../assets/assets/images/failedmobile.png',
      height: height,
      width: width,
    );
  }

  Widget Desktop(double height, double width) {
    return Image.asset(
      '../assets/assets/images/failureimg.png',
      height: height,
      width: width,
    );
  }
}
