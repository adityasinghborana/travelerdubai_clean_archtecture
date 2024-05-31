import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_option_dynamic_response.dart';

import '../../../tourdetails/presentation/tour_options_controller.dart';
import '../../../tourdetails/presentation/tours_controller.dart';
import '../../../tourdetails/tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetails/tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetails/tourdetail_data_layer/repository/tour_repository.dart';

class TourCards extends StatelessWidget {
  final TourlistController tourListController = Get.find();
  final ScrollController? scrollController;
  final TourOptionStaticDataController static;
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));

  final List<Experiences> tours;
  final double cardWidth;
  final String? filterProperty;

  TourCards(
      {super.key,
      required this.tours,
      this.scrollController,
      required this.cardWidth,
      required this.filterProperty,
      required this.static});

  @override
  Widget build(BuildContext context) {
    List<Experiences> filteredTours = tours.where((tour) {
      switch (filterProperty) {
        case 'isRecommended':
          return tour.isvisibleReccomendedTours == true;
        case 'isPopular':
          return tour.isvisiblePopularTours == true;
        default:
          true;
      }
      return true;
    }).toList();
    return SizedBox(
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: filteredTours.length,
        itemBuilder: (context, index) {
          final tour = filteredTours[index];
          return AspectRatio(
            aspectRatio: 9 / 16,
            child: InkWell(
              onTap: () => _onTourCardTap(tour),
              child: SizedBox(
                width: cardWidth,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _buildTourImage(tour),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTourCardTap(Experiences tour) {
    String tourDetailId = "${tour.tourdetails?[0].id}";

    Get.toNamed(
      '/tour_details',
      parameters: {'tourId': tourDetailId.toString()},
    );
  }

  Widget _buildTourImage(Experiences tour) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(children: [
        AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.network(
            "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
            fit: BoxFit.cover,

            // width: Get.width * 0.119,
          ),
        ),
        Container(
          decoration: BoxDecoration(gradient: imageGradient),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildRatingAndCity(tour),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _getPrice(tour, static.dynamicOptionsMap),
          ),
        ),
      ]),
    );
  }

  Widget _buildRatingAndCity(Experiences tour) {
    return SelectableText(
      tour.tourName,
      style: GoogleFonts.playfairDisplay(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget _getPrice(
      Experiences tour, Map<int, TourOptionDynamicResult> dynamicOptionsMap) {
    ever(tourController.isLoading, (isLoading) {
      if (!isLoading) {
        print("called");
        static.id.value = tour.tourId.toString();
        static.contractid.value = tour.contractId.toString();
        static.adultsSelectedValue.value = 1;
        static.getOptionsDynamicData();
      }
    });

    return Obx(() {
      TourOptionDynamicResult result = static.dynamicoptions.firstWhere(
        (element) => element.tourId == tour.tourId,
        orElse: () =>
            TourOptionDynamicResult(), // Provide a fallback if no match is found
      );
      if (result != TourOptionDynamicResult()) {
        dynamicOptionsMap[result.tourId ?? 0] = result;
      }
      return dynamicOptionsMap[tour.tourId]?.finalAmount == null
          ? SelectableText(
              "Loading...",
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          : SelectableText(
              "Price starts from ${dynamicOptionsMap[tour.tourId]!.finalAmount! + dynamicOptionsMap[tour.tourId]!.adultPrice!.toDouble()}",
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            );
    });
  }
}
