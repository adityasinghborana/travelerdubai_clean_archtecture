import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/events/presentation/eventmobile.dart';
import 'package:travelerdubai/events/presentation/eventsDesktop.dart';

import '../../Components/floatingaction_button.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingCartButton(),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Eventspage();
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Eventmobile();
          } else {
            return Eventmobile();
          }
        },
      ),
    );
  }
}