import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/auth/presentation/screens/Desktop/sign_up_desktop.dart';
import 'package:travelerdubai/auth/presentation/screens/mobile/sign_up_mobile.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop ||
            sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return SignUpDesktop();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return SignUpMobile();
        } else {
          return SignUpDesktop();
        }
      },
    );
  }
}
