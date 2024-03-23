import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';

class TourCards extends StatelessWidget {
  final TourlistController tourlistController = Get.find();
  final ScrollController? scrollController;
  final List<Experiences> tours;
  final double cardwidth ;

  TourCards({super.key, required this.tours, this.scrollController , required this.cardwidth  });

  @override
  Widget build(BuildContext context ) {
    return Container(
      width: Get.width *.95 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: tourlistController.tours.length,
        itemBuilder: (context, index) {
          final tour = tourlistController.tours[index];
          return InkWell(
            onTap: () => _onTourCardTap(tour), // Use the onTap function
            child: SizedBox(

              width: cardwidth,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _buildTourImage(tour),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTourCardTap(Experiences tour) {
    String tourId = tour.id.toString();

    Get.toNamed(
      '/tour_details',
      arguments: tourId,
    );
  }

  Widget _buildTourImage(Experiences tour) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(children: [
        Image.network(
          "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
          fit: BoxFit.cover,
          height: Get.height * .60,
          // width: Get.width * 0.119,
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
        )
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


}
