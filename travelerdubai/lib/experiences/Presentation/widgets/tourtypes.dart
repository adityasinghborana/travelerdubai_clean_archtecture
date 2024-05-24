import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';

class TourTypes extends StatelessWidget {
  final Function(String) onTap;
  final VoidCallback onDoubleTap;

  const TourTypes({super.key, required this.onTap, required this.onDoubleTap});

  @override
  Widget build(BuildContext context) {
    final ScrollController listController = ScrollController();
    ExperienceController experienceController = Get.find();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: backgroundgradient,
            boxShadow: [
              BoxShadow(
                color: colorPrimary.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.011, vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Browse By Themes ',
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  colorHighlights,
                                  colorPrimary
                                ],
                              ).createShader(Rect.fromLTWH(
                                  Get.width * 0.05,
                                  20.0,
                                  80.0,
                                  20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.8,
                    child: Obx(() {
                      if (experienceController.tourTypes.isEmpty) {
                        return const Center(child: Text('Empty'));
                      } else {
                        return ListView.builder(
                          controller: listController,
                          itemCount: experienceController.tourTypes.length,
                          itemBuilder: (context, index) {
                            String cityTourType = experienceController.tourTypes[index]['cityTourType'];
                            return HoverCard(
                              cityTourType: cityTourType,
                              onTap: () => onTap(cityTourType),
                              onDoubleTap: onDoubleTap,
                            );
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class HoverCard extends StatefulWidget {
  final String cityTourType;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  HoverCard({
    required this.cityTourType,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
      child: Card(
        surfaceTintColor: colorwhite,
        elevation: 4,
        child: InkWell(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
            widget.onTap();
          },
          onDoubleTap: () {
            setState(() {
              _isSelected = false;
            });
            widget.onDoubleTap();
          },
          child: MouseRegion(
            onEnter: (_) => setState(() {
              _isHovered = true;
            }),
            onExit: (_) => setState(() {
              _isHovered = false;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: _isSelected ? Colors.blueAccent : (_isHovered ? Colors.blueAccent.withOpacity(0.9) : Colors.white),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: colorlightgrey.withOpacity(0.2),
                  width: 2.0,
                ),
              ),
              height: Get.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.009),
                      child: Text(
                        widget.cityTourType,
                        textAlign: TextAlign.center,
                        style: bodyBlack(context).copyWith(fontSize: 12,
                          color: _isSelected || _isHovered ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
