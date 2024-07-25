import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/footer.dart';

import 'package:travelerdubai/eventDetails/eventdetails_Controller.dart';
import 'package:travelerdubai/eventDetails/widgets/ArtistColumn.dart';
import 'package:travelerdubai/eventDetails/widgets/Heading.dart';
import 'package:travelerdubai/eventDetails/widgets/eventOptions.dart';
import 'package:travelerdubai/eventDetails/widgets/iconsColumns.dart';

import '../Components/date_picker.dart';
import '../Components/header.dart';
import '../core/constants/constants.dart';
import '../tourdetails/presentation/Widgets/dropdown_widget.dart';
import '../tourdetails/presentation/Widgets/transfer_time_dropdown.dart';

class EventDetails extends StatelessWidget {
  final EventdetailsController eventdetailsController =
      Get.put<EventdetailsController>(EventdetailsController());

  EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String? eventId = Get.parameters['eventId'];
    if (eventId != null && eventId.isNotEmpty) {
      final int eventIdInt = int.parse(eventId);
      eventdetailsController
          .fetchEvent(eventIdInt); // Fetch the event details based on the ID
    } else {
      print('Invalid or missing eventId parameter');
    }

    final PageController pageController = PageController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Obx(() {

              return AuraUICarousel(
                duration: Duration(seconds: 3),
                images: eventdetailsController.images.value,
                maxWidth: 1340,
                height: MediaQuery.of(context).size.height * 0.5,
                showButtons: true,
                pageController: pageController,
              );
            }),
            Heading(context, eventdetailsController),
            IconColums(context),
            Row(
              children: [
                EventOptions(),
                ArtistColumn(context,eventdetailsController),
              ],
            ),
           SizedBox(height: 20,),
            buildFooter(),
          ],
        ),
      ),
    );
  }








}



