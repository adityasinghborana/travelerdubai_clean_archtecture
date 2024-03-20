import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';

class TourCards extends StatelessWidget {
  final TourlistController tourlistController = Get.find();
  final ScrollController? scrollController;
  final List<Experiences> tours;

  TourCards({super.key, required this.tours, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: tourlistController.tours.length,
        itemBuilder: (context, index) {
          final tour = tourlistController.tours[index];
          return InkWell(
            onTap: () => _onTourCardTap(tour), // Use the onTap function
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                width: Get.width * 0.14,
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
        //_buildDuration(tour),
        _buildRatingAndCity(tour)
      ]),
    );
  }

  Widget _buildTourName(Experiences tour) {
    return Text(
      _truncateDescription("${tour.tourName}", 4),
      style: GoogleFonts.playfairDisplay(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildShortDescription(Experiences tour) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        child: Text(
          _truncateDescription(tour.tourShortDescription, 13),
          style: GoogleFonts.playfairDisplay(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildRatingAndCity(Experiences tour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            tour.cityName,
            style: GoogleFonts.playfairDisplay(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Text(
                "Rating ${tour.rating} ",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDuration(Experiences tour) {
    return Container(
      child: Row(
        children: [
          const Icon(Icons.timer_rounded),
          Text(
            " ${tour.duration} ",
            style: GoogleFonts.playfairDisplay(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    }
    return '${words.take(maxWords).join(' ')}...';
  }
}
