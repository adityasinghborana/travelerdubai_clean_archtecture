import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import '../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../tourdetail_data_layer/repository/tour_repository.dart';
import '../tours_controller.dart';
import 'detailbox.dart';
import 'html.dart';

class MainDetails extends StatelessWidget {
  final String imageUrl;

  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));

  TextStyle? textStyle = bodyBlack(Get.context!)
      .copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  MainDetails({super.key, this.textStyle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: Column(
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
                      htmlContent:
                          tourController.tour.value.importantInformation),
                  textStyle: textStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DetailBox(
                  title: "Itinerary Description",
                  description: HtmlDisplayWidget(
                      htmlContent:
                          tourController.tour.value.itenararyDescription),
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
          ),
        ),
        Get.width > 1024
            ? Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: colorwhite,
                    padding: const EdgeInsets.all(30),
                    width: double.infinity,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(imageUrl)),
                        GradientText(
                          'Tour Summary ',
                          style: GradientStyle,
                          colors: const [colorHighlights, colorPrimary],
                        ),
                        Container(
                          child: HtmlDisplayWidget(
                              htmlContent:
                                  tourController.tour.value.usefulInformation),
                        ),
                      ],
                    ),
                  ),
                ))
            : Container(),
      ],
    );
  }
}
