import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/helperfunctions.dart';
class FloatingCartButton extends StatelessWidget {

  FloatingCartButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Obx(() {
        return Text("${cartItemsLength.value ?? 0 }");
      }),

      child: FloatingActionButton(
        mini: Get.width > 600 ? false : true,
        isExtended: true,
        backgroundColor: Colors.white,
        child: Icon(
          FontAwesomeIcons.cartShopping,
          size: 18,
          color: colorMediumBlue,
        ),
        onPressed: () {
          Get.toNamed("/checkout");
        },
      ),
    );
  }


}
