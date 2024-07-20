import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/events/event_controller.dart';

import '../../Components/BannerSearchWidget.dart';
import '../../Components/Sidebar.dart';
import '../../Components/drawer.dart';
import '../../Components/header.dart';

class Eventspage extends StatelessWidget {

  final EventController experienceController = Get.put(EventController());
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  Eventspage({super.key});

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      drawer: drawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Header(),
            HeaderSearchWidget(
              imageUrl: "https://d1i3enf1i5tb1f.cloudfront.net/Tour-Images/false-4710/emirates-zoo-img.jpg",
              title: "Discover All Events",
              searchController: searchController,
              onSearch: (value) {
                experienceController.searchCityTours(value);
              },
            ),
            SizedBox(height: Get.height * .03),
            SizedBox(
              width: Get.width * 0.95,
              height: Get.height * .95,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Obx(() {
                      return Tourtypes();
                    }),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: tourcards()
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Tourtypes() {
    List<String> stringList = experienceController.eventTypes.map((e) =>
        e.toString()).toList();
    return TourTypes(
      title: "Browse Events", items: stringList, onTap: (String eventType) {
      experienceController.filterCityeventsByType(eventType);
    },onDoubleTap: ()=>null,);
  }

  Widget tourcards() {
    return Obx(() {
      if (experienceController.cityEvents.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        List<dynamic> displayedTours = experienceController
            .selectedEventType.isEmpty
            ? experienceController.cityEvents
            : experienceController.cityEvents
            .where((tour) =>
        tour['cityeventType'] ==
            experienceController.selectedTourType.value)
            .toList();


        return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.builder(
            //controller: controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
            ),
            itemCount: displayedTours.length,
            itemBuilder: (context, index) {
              String tourName = displayedTours[index]['eventName'];
              String image = displayedTours[index]['imagePath'];


              return InkWell(
                onTap: () =>
                    Get.toNamed(
                      '/tour_details',
                      //parameters: {'tourId': tourDetailId.toString()},
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.network(image,
                        height: Get.height * 0.6,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: imageGradient),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            tourName ?? "Undefined",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}




