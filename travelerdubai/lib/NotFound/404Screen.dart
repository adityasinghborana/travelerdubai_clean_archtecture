import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageNotFound extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
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
      
      ),
    );
  }
Widget Mobile(){
    return Center(
        child: Container(child: Image.asset('../assets/images/404mobile.png',fit: BoxFit.cover,),));
}

  Widget Desktop() {
    return Center(
        child: Container(child: Image.asset('../assets/images/404.png'),));
  }
}



