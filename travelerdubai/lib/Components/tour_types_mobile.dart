import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';

class TourTypesMobile extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onTap;

  TourTypesMobile({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.03,
            ),
            child: ExpansionTile(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none, // Remove the border
              ),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '$title  ',
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [colorHighlights, colorPrimary],
                          ).createShader(
                              const Rect.fromLTWH(50.0, 20.0, 90.0, 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                SizedBox(
                  height: 50,
                  child: items.isEmpty
                      ? const Center(child: Text('Empty'))
                      : ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      items.length,
                          (index) {
                        String item = items[index];
                        bool isSelected = selectedItem == item;

                        return InkWell(
                          onTap: () => onTap(item),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02,
                            ),
                            child: Container(
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                color:
                                isSelected ? colorPrimary : colorwhite,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: colorlightgrey.withOpacity(0.2),
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.009),
                                      child: Text(
                                        item,
                                        textAlign: TextAlign.center,
                                        style: bodygrey(Get.context!)
                                            .copyWith(
                                          color: isSelected
                                              ? colorwhite
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
