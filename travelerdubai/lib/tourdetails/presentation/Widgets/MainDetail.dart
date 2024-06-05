import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

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

  TextStyle? textStyle = bodyBlack(Get.context!)
      .copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  MainDetails({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            isExpanded: true,
            title: "Tour Description",
            description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.tourDescription),
            textStyle: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Tour Inclusion",
            description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.tourInclusion),
            textStyle: textStyle,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Important Information",
            description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.importantInformation),
            textStyle: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Itinerary Description",
            description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.itenararyDescription),
            textStyle: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DetailBox(
            title: "Useful Information",
            description: HtmlDisplayWidget(
                htmlContent: tourController.tour.value.usefulInformation),
            textStyle: textStyle,
          ),
        ),
      ],
    );
  }
}
