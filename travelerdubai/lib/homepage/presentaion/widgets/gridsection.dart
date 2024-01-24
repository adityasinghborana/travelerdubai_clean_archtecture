import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:travelerdubai/homepage/mygridscetio_controller.dart';

class MyGridSectionWidget extends GetView<MyGridSectionController> {
  const MyGridSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: Get.height * 0.70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/dubai.jpg',
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 10, left: 50, right: 50),
              child: Column(
                children: [
                  Obx(() => Text(
                        controller.heading.value,
                        style: GoogleFonts.playfairDisplay(
                          // Apply Playfair Display font
                          textStyle: const TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  Obx(() => Text(
                        controller.subheading.value,
                        style:
                            const TextStyle(fontSize: 28, color: Colors.grey),
                      )),
                  const SizedBox(height: 0),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: controller.cardsData.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> cardData =
                            controller.cardsData[index];
                        String iconName = cardData['icon'] ??
                            'default_icon'; // Default icon name if not provided
                        IconData icon = _getIconForName(
                            iconName); // Get IconData based on name
                        Color iconColor = _getColorForCard(
                            cardData['iconColor']); // Get Color for the icon

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icon,
                                    size: 40,
                                    color:
                                        iconColor), // Use the dynamic icon color here
                                const SizedBox(height: 10),
                                SelectableText(
                                  // Use SelectableText for selectable text
                                  cardData['heading'] ?? 'Default Heading',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                SelectableText(
                                  // Use SelectableText for selectable text
                                  cardData['subheading'] ?? 'Subheading',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

IconData _getIconForName(String iconName) {
  if (iconName == 'gift') {
    return Icons.card_giftcard;
  } else if (iconName == 'star') {
    return Icons.star;
  }
  return Icons.stacked_line_chart_outlined;
}

Color _getColorForCard(String colorValue) {
  // Check if the colorValue is not null or empty
  if (colorValue.isNotEmpty) {
    try {
      // Add alpha value (255) to the short hex color value and parse into Color object
      String fullHexValue = "FF${colorValue.substring(1)}";
      return Color(int.parse(fullHexValue, radix: 16));
    } catch (e) {
      print(e.toString());
    }
  }
  return Colors.blue; // Default color if parsing fails or not provided
}
