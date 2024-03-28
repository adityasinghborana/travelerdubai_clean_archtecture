import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/core/Progress_indicator.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/Maindetails.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/detailbox.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/imagechanger.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';

import '../../../core/widgets/footer.dart';
import '../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../Widgets/html.dart';
import '../Widgets/show_date_picker.dart';

class TourPage extends StatelessWidget {
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));
  final TourOptionStaticDataController static = Get.put(
    TourOptionStaticDataController(
        GetTourOptionsStaticDataUseCase(
            TourOptionsRepositoryImpl(TourOptionRemoteService(Dio()))),
        GetTourOptionsDynamicDataUseCase(
          TourOptionsRepositoryImpl(
            TourOptionRemoteService(Dio()),
          ),
        ),
        GetTimeSlotUseCase(
          TimeSlotRepositoryImpl(
            TimeSlotRemoteService(Dio()),
          ),
        ),
        UpdateCartUseCase(
          CartRepositoryImpl(
            CartRemoteService(Dio()),
          ),
        )),
  );

  TourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text("Add to Cart"),
        onPressed: () => Get.toNamed("/checkout"),
      ),
      body: Obx(
        () {
          if (tourController.isLoading.isTrue) {
            return const CircularProgressIndicator();
          } else {
            static.id.value = tourController.tour.value.TourId.toString();
            static.contractid.value =
                tourController.tour.value.contractId.toString();

            static.getOptionsStaticData();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      //fixed the header issue
                      Header(),
                      ImageChangerWidget(tourController.tourImages),
                      formSection(),

                      MainDetails(),
                      Obx(() {
                        if (static.Loading.value == true) {
                          return Progressindicator();
                        } else {
                          return options();
                        }
                      }),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                  title: "Tour Description",
                                  Description: HtmlDisplayWidget(
                                      htmlContent: tourController
                                          .tour.value.tourDescription)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                  title: "Tour Inclusion",
                                  Description: HtmlDisplayWidget(
                                      htmlContent: tourController
                                          .tour.value.tourInclusion)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "Rayna Tours Advantage",
                                Description: HtmlDisplayWidget(
                                    htmlContent: tourController
                                        .tour.value.raynaToursAdvantage),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "What's In This Tour",
                                Description: HtmlDisplayWidget(
                                    htmlContent: tourController
                                        .tour.value.whatsInThisTour),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "Important Information",
                                Description: HtmlDisplayWidget(
                                    htmlContent: tourController
                                        .tour.value.importantInformation),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "Itinerary Description",
                                Description: HtmlDisplayWidget(
                                    htmlContent: tourController
                                        .tour.value.itenararyDescription),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "Useful Information",
                                Description: HtmlDisplayWidget(
                                    htmlContent: tourController
                                        .tour.value.usefulInformation),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DetailBox(
                                title: "FAQ Details",
                                Description: HtmlDisplayWidget(
                                    htmlContent:
                                        tourController.tour.value.faqDetails),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Container(
                            child: Showdatepicker(),
                          ))
                    ],
                  ),
                  buildFooter()
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget formSection() {
    return Material(
      elevation: 8.0,
      child: Container(
        color: Colors.green,
        width: 500,
        height: 500,
        child: Column(
          children: [
            //getWidget((p0) => {}, (p0) => {}, (p0) => {}),
            buildNumberInput('Adult', (p0) => null)
          ],
        ),
      ),
    );
  }

  Widget getWidget(Function(int) onAdultsChanged,
      Function(int) onChildrenChanged, Function(int) onInfantsChanged) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNumberInput('Adults', onAdultsChanged),
            buildNumberInput('Children', onChildrenChanged),
            buildNumberInput('Infants', onInfantsChanged),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'No. of persons: ${onAdultsChanged(0) + onChildrenChanged(0) + onInfantsChanged(0)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildNumberInput(String label, Function(int) onChange) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 10), // Add some space between label and the box

          // Parent container wrapping the three cells horizontally
          Container(
            height: 40, // Set a fixed height for the box
            decoration: BoxDecoration(
                color: Colors.white, // Same background color for the box
                borderRadius: BorderRadius.circular(8), // Rounded corners
                border: Border.all(color: Colors.grey) // Rounded corners
                ),
            child: Row(
              children: [
                // Left container for the '-' button
                Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    color: color_EEEEEE,
                    border: Border(
                      right: BorderSide(color: Colors.grey), // Right border
                    ),
                  ), // Set a fixed width for the button cell
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => {},
                  ),
                ),
                // Middle container for the number display
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: static.adultTextController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      onChange(int.parse(value));
                    },
                  ),
                ),
                // Right container for the '+' button
                Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey), // Left border
                    ),
                  ), // Set a fixed width for the button cell
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
