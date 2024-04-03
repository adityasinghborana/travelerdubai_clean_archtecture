import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/experiences/Presentation/Experiences_Desktop.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_mobile.dart';

class Experiences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return ExperiencesDesktop();
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return ExperiencesMobile();
          } else {
            return ExperiencesMobile();
          }
        },
      ),
    );
  }
}
