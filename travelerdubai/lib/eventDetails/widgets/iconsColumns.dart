import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';

Widget IconColums(
    BuildContext context, ) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildIconColumns(),
    ),
  );
}

List<Widget> _buildIconColumns() {
  return [
    _buildIconColumn(
        Icons.security_rounded, 'Secure Checkout', 'Fast and Secure Payment'),
    _buildIconColumn(Icons.fact_check_outlined, 'Instant confirmation',
        'Refund Guarantee Option'),
    _buildIconColumn(FontAwesomeIcons.ticket, 'Official Ticket Seller',
        'Used by 3m+ people'),
    _buildIconColumn(Icons.co_present, '24/7 customer service',
        'Reliable after sales support'),
  ];
}

Widget _buildIconColumn(IconData icon, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colorgreen),
        Text(title, style: iconText),
        Text(subtitle, style: iconText2),
      ],
    ),
  );
}