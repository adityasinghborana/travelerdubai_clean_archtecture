import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/widgets/Textformfield.dart';

class ProfileInfo extends StatelessWidget {
  final TextEditingController namecontrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      child: Flexible(
        child: Column(
          children: [
            buildTextFormField("Name", namecontrller),
          ],
        ),
      ),
    );
  }
}
