import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/model/featuremodel.dart';

class FeatureController extends GetxController {
  final features = <Feature>[
    Feature(title: "Best Travel Agency", icon: Icons.check_circle),
    Feature(title: "Exclusive Travel Places", icon: Icons.location_on),
    Feature(title: "Best Price Guarantee", icon: Icons.attach_money),
  ].obs;
}
