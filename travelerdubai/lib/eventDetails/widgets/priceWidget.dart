
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/eventDetails/eventdetails_Controller.dart';

import '../../core/constants/constants.dart';

class Price extends StatelessWidget {
  final double adultprice;
  final double childprice;
  final double infantprice;
  Price(this.adultprice, this.childprice, this.infantprice);

final EventdetailsController eventdetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    num finalAmount =
        eventdetailsController.adultsSelectedValue.value * adultprice +
            eventdetailsController.childrenSelectedValue.value * childprice +
            eventdetailsController.infantsSelectedValue.value * infantprice;
    return Container(
      width: Get.width * 0.09,
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: colorlightgrey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.008),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "AED",
              style: bodyBlack(context).copyWith(
                fontSize: Get.width * 0.01,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " $finalAmount",
              style: bodyBlack(context).copyWith(
                fontSize: Get.width * 0.01,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }


}




