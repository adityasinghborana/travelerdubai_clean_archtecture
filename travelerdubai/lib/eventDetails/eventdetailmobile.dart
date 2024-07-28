import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/footer_mobile.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/eventDetails/widgets/ArtistColumn.dart';
import 'package:travelerdubai/eventDetails/widgets/Heading.dart';

import 'eventdetails_Controller.dart';

class EventDetailMobile extends StatelessWidget {
  final EventdetailsController eventdetailsController =
  Get.put<EventdetailsController>(EventdetailsController());

  EventDetailMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MobileHeader(context: context),
            Obx(() {
              return AuraUICarousel(
        
                duration: Duration(seconds: 3),
                images: eventdetailsController.images.value,
                maxWidth: 1340,
        
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                showButtons: true,
                pageController: pageController,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonView(btnName: "See Options",
                bgColor: colorMediumBlue,
                borderColor: colorMediumBlue,),
            ),
            Heading(context, eventdetailsController),
        
        
          Container(
            padding:EdgeInsets.all(12) ,
              height: 300,
              child: ArtistColumn(context, eventdetailsController,padding: 0)),
        
           // SizedBox(height: 40,),
        
           // buildFooterMobile(),
          ],
        ),
      ),
    );
  }
}
