import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/widgets/Textformfield.dart';

class ProfileInfo extends StatelessWidget {
  final TextEditingController namecontrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 2,
      child: Flexible(
        flex: 1,
        child: Column(
          children: [
           buildTextFormField("Name", namecontrller),
           buildTextFormField("Email", namecontrller),
            buildTextFormField("Age", namecontrller),
            buildTextFormField("MobileNumber", namecontrller),
            buildTextFormField("DOB", namecontrller),
            buildTextFormField("Address", namecontrller),
          ],
        ),
      ),
    );
  }
}
