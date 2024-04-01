import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../tourdetail_data_layer/repository/tour_repository.dart';
import '../tours_controller.dart';
import 'detailbox.dart';
import 'html.dart';

class MainDetails extends StatelessWidget {
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));

  MainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
              isExpanded: true,
              title: "Tour Description",
              Description: HtmlDisplayWidget(
                  htmlContent: tourController.tour.value.tourDescription)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
              title: "Tour Inclusion",
              Description: HtmlDisplayWidget(
                  htmlContent: tourController.tour.value.tourInclusion)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Rayna Tours Advantage",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.raynaToursAdvantage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "What's In This Tour",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.whatsInThisTour),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Important Information",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.importantInformation),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Itinerary Description",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.itenararyDescription),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Useful Information",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.usefulInformation),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "FAQ Details",
            Description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.faqDetails),
          ),
        ),
      ],
    );
  }
}
