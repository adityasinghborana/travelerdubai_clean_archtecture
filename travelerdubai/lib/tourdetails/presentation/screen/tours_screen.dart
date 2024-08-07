import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/desktop/tours_screen_desktop.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/tours_screen_mobile.dart';

class TourPage extends StatelessWidget {
  const TourPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return TourPageDesktop();
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
          sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return TourPageMobile();
      } else {
        return TourPageDesktop();
      }
    });
  }
}
