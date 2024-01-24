import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

import 'package:travelerdubai/homepage/presentaion/feature_section_controller.dart';
import 'package:travelerdubai/homepage/model/featuremodel.dart';

class FeaturesSection extends StatelessWidget {
  final FeatureController controller = Get.put(FeatureController());

  FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5, // Adjusted value
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Features",
            style: GoogleFonts.playfairDisplay(
              // Apply Playfair Display font
              textStyle: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SelectableText(
            // Use SelectableText for selectable text
            "Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Column(
              children: controller.features
                  .map((feature) => FeatureRow(
                        feature: feature,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final Feature feature;

  const FeatureRow({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            feature.icon,
            color: Colors.amber, // Set your desired icon color
          ),
          const SizedBox(width: 8),
          Text(
            feature.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
