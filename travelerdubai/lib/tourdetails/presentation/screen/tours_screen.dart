import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/core/Progress_indicator.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/Maindetails.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/detailbox.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/imagechanger.dart';
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
  final TouroptionstaticdataController static = Get.put(
    TouroptionstaticdataController(
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
      UpdateCartUseCase(CartRepositoryImpl(CartRemoteService(Dio()),),)
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Text("Add to Cart"),
        onPressed: () => Get.toNamed("/checkout"),
      ),
      body: Obx(
        () {
          if (tourController.isLoading.isTrue) {
            return CircularProgressIndicator();
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
                      Header(),
                      ImageChangerWidget(tourController.tourImages),
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
}
