import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';

Widget IconColums(
    BuildContext context, ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30,right: 70.0,left: 70.0 ),
    child: Container(

    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:colorwhite,border: Border.all(color: colorgreen)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildIconColumns(),
        ),
      ),
    ),
  );
}

List<Widget> _buildIconColumns() {
  return [
    _buildIconColumn(
        Icons.security_rounded, 'Secure Checkout', 'Fast and Secure Payment'),
    _buildIconColumn(Icons.fact_check_outlined, 'Instant confirmation',
        'Your Tickets Within Minutes'),
    _buildIconColumn(FontAwesomeIcons.ticket, 'Official Ticket Seller',
        'Your Trusted Source For UAE Tickets and Tours'),
    _buildIconColumn(Icons.co_present, '24/7 customer service',
        'Reliable after sales support'),
  ];
}

Widget _buildIconColumn(IconData icon, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
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