import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/events/event_controller.dart';

class Eventspage extends StatelessWidget {
  final EventController experienceController = Get.put(EventController());
  TextEditingController searchController = TextEditingController();

  Eventspage({super.key});

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Tourtypes(),
          ),
          Flexible(
              flex: 4,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height * 0.3,
                        child: Image.network(
                          "https://source.unsplash.com/random",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top:
                            20, // Adjust the vertical position of the text field
                        left:
                            20, // Adjust the horizontal position of the text field
                        right: 20, // Adjust the width of the text field
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(
                                  width:
                                      10), // Add space between icon and text field
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    experienceController
                                        .searchCityevents(value);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.7, child: tourcards()),
                ],
              )),
        ],
      ),
    );
  }

  Widget Tourtypes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorwhite,
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Filters",
                  style: H3,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (experienceController.eventTypes.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: experienceController.eventTypes.length,
                      itemBuilder: (context, index) {
                        String cityTourType = experienceController
                            .eventTypes[index]['cityeventType'];
                        return InkWell(
                          onTap: () {
                            experienceController
                                .filterCityeventsByType(cityTourType);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cityTourType,
                              style: bodyblack(context),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tourcards() {
    return Obx(() {
      if (experienceController.cityEvents.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        List<dynamic> displayedTours = experienceController
                .selectedTourType.isEmpty
            ? experienceController.cityEvents
            : experienceController.cityEvents
                .where((tour) =>
                    tour['cityeventType'] ==
                    experienceController.selectedTourType.value)
                .toList();

        return ListView.builder(
          itemCount: displayedTours.length,
          itemBuilder: (context, index) {
            String tourName = displayedTours[index]['eventName'];
            String cityTourType = displayedTours[index]['cityeventType'];
            String image = displayedTours[index]['imagePath'];
            //String city = displayedTours[index]["cityName"];
            String shortdescription =
                displayedTours[index]["eventShortDescription"];
            int review = displayedTours[index]["rating"];

            return Container(
              child: InkWell(
                onTap: (() => Get.toNamed('/tour_details',
                    arguments: displayedTours[index]['tourId'])),
                child: Card(
                  color: colorwhite,
                  elevation: 3,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                          child: Image.network(
                            image,
                            height: Get.height / 6,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: SizedBox(
                          height: Get.height / 6,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tourName,
                                  style: H3,
                                ),
                                Expanded(child: Container()),
                                Row(
                                  children: [
                                    Text(
                                      "Event Type - $cityTourType",
                                      style: bodyf,
                                    ),
                                    Expanded(child: Container()),
                                    // Text(
                                    //   "City - $city",
                                    //   style: bodyf,
                                    // ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  shortdescription,
                                  style: bodyblack(context),
                                ),
                                Expanded(child: Container()),
                                Row(
                                  children: [
                                    Text(
                                      'Rating: $review',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: bodyblack(context),
                                    ),
                                    const SizedBox(
                                        width:
                                            5), // Adjust spacing between text and stars
                                    Row(
                                      children: List.generate(
                                        review, // Assuming review contains the rating value
                                        (index) => const Icon(
                                          Icons.star,
                                          color:
                                              colorPrimary, // Choose your star color
                                          size: 20, // Choose your star size
                                        ),
                                      ).toList(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
