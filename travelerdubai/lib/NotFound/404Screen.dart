import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageNotFound extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
// Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Desktop();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Desktop();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ) {
          return Mobile();
        }
        else{
          return Text("Your device is not compataible");
        }
      },

    );
  }
Widget Mobile(){
    return Expanded(child: Center(
        child: Container(child: Image.asset('../assets/assets/images/404mobile.png',fit: BoxFit.cover,),)));
}

  Widget Desktop() {
    return Expanded(child: Center(
        child: Container(child: Image.asset('../assets/assets/images/404.png'),)));
  }
}



