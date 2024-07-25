import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';

class TourCards extends StatelessWidget {
  final TourlistController tourListController = Get.find();
  final ScrollController? scrollController;
  final List<Experiences> tours;
  final double cardWidth;
  final String? filterProperty;

  TourCards(
      {super.key,
        required this.tours,
        this.scrollController,
        required this.cardWidth,
        required this.filterProperty});

  @override
  Widget build(BuildContext context) {
    List<Experiences> filteredTours = tours.where((tour) {
      switch (filterProperty) {
        case 'isRecommended':
          return tour.isvisibleReccomendedTours == true;
        case 'isvisibleDesertsafari':
          return tour.isvisibleDesertsafari == true;
        case 'isvisibleCulturesandattractions':
          return tour.isvisibleCulturesandattractions == true;
        case 'isvisibleDhowcruise':
          return tour.isvisibleDhowcruise == true;
        case 'isvisibleWaterActivities':
          return tour.isvisibleWateractivities == true;

        default:
          return true;
      }
    }).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      itemCount: filteredTours.length,
      itemBuilder: (context, index) {
        final tour = filteredTours[index];
        return HoverScaleCard(
          tour: tour,
          cardWidth: cardWidth,
          onTap: () => _onTourCardTap(tour),
        );
      },
    );
  }

  void _onTourCardTap(Experiences tour) {
    String tourDetailId = "${tour.tourdetails?.id}";
    Get.toNamed(
      '/tour_details',
      parameters: {'tourId': tourDetailId.toString()},
    );
  }
}

class HoverScaleCard extends StatefulWidget {
  final Experiences tour;
  final double cardWidth;
  final VoidCallback onTap;

  HoverScaleCard(
      {required this.tour, required this.cardWidth, required this.onTap});

  @override
  _HoverScaleCardState createState() => _HoverScaleCardState();
}

class _HoverScaleCardState extends State<HoverScaleCard> {
  bool _isHovered = false;
  bool _isTapped = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovered = isHovering;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isTapped = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isTapped = false;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _isTapped = false;
    });
  }

  Widget _buildTourImage(Experiences tour) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(

        child: Stack(
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: NetworkImage(
                    "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              duration: const Duration(milliseconds: 2000),
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
          ],
        ),
      ),
    );
  }

  Widget _buildRatingAndCity(Experiences tour) {
    return SelectableText(
      tour.tourName ?? "undefined",
      style: GoogleFonts.playfairDisplay(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered || _isTapped ? 1.015 : 1.0),
          child: SizedBox(
            width: widget.cardWidth,
            child: Padding(
              padding: Get.width>600? const EdgeInsets.symmetric(horizontal: 8.0):const EdgeInsets.symmetric(horizontal: 1.0,vertical: 2),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _buildTourImage(widget.tour),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
