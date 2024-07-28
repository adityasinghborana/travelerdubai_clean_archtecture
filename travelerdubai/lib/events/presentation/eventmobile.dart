import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/Mobileheader.dart';
import '../../Components/drawer.dart';
import '../../Components/tour_types_mobile.dart';
import '../../core/constants/constants.dart';
import '../../core/controller/headercontroller.dart';
import '../event_controller.dart';

class Eventmobile extends StatelessWidget {
  final EventController experienceController = Get.put(EventController());
  final TextEditingController searchController = TextEditingController();

  Eventmobile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HeaderController());

    List<dynamic> displayedTours =
        experienceController.selectedEventType.isEmpty
            ? experienceController.cityEvents
            : experienceController.cityEvents
                .where((tour) =>
                    tour['eventType'] ==
                    experienceController.selectedTourType.value)
                .toList();

    return Scaffold(
        appBar: MobileHeader(
          context: context,
          isBackButton: false,
        ),
        drawer: drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.15,
              child: Stack(
                children: [
                  Image.network(
                    "https://source.unsplash.com/random",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text("Discover All Experiences",
                                      style: H1(context))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          width: Get.width * 0.8,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: colorwhite,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(width: 10),
                              Flexible(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    experienceController.searchCityTours(value);
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
                      ],
                    ),
                  )
                ],
              ),
            ),
            Obx(() {
              return TourTypesMobile(
                title: 'Browse By Themes',
                items: experienceController.eventTypes.value
                    .map((e) => e.toString())
                    .toList(),
                selectedItem: experienceController.selectedTourType.value,
                onTap: (item) {
                  if (experienceController.selectedTourType.value == item) {
                    experienceController.resetSelectedTourType();
                  } else {
                    experienceController.filterCityeventsByType(item);
                  }
                },
              );
            }),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Obx(() {
                    return EventCardsMobile(experienceController.cityEvents);
                  })),
            )
          ],
        ));
  }
}

Widget EventCardsMobile(
  List<dynamic> displayedTours,
) {
  final crossAxisCount = Get.width < 600 ? 2 : 3;
  final EventController experienceController = Get.find();

  List<dynamic> filteredTours = displayedTours;
  print("$filteredTours");
  return Padding(
    padding: EdgeInsets.all(Get.width * 0.02),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.1,
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      itemCount: filteredTours.length,
      itemBuilder: (context, index) {
        String eventDetailId =
            filteredTours[index]['eventdetail'][0]['id'].toString();
        final tour = filteredTours[index];

        return InkWell(
          onTap: () => Get.toNamed(
            '/eventdetails',
            parameters: {'eventId': eventDetailId},
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    tour['imagePath'],
                    //tour.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(gradient: imageGradient),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      tour['eventName'] ?? "Undefined",
                      style: GoogleFonts.outfit(
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
