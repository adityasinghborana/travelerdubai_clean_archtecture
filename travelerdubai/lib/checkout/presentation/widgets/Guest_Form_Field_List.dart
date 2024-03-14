import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/checkout_controller.dart';
import 'package:travelerdubai/core/widgets/Textformfield.dart';

import '../model/guest.dart';

Widget buildGuestListTile() {
  final CheckoutController checkoutController = Get.find();
  return Column(
    children: [
      ListTile(
        title: Text('Guest Information'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            checkoutController.guests.add(Guest());
          },
        ),
      ),
      Obx(
        () => Column(
          children: List.generate(
            checkoutController.guests.length,
            (index) => buildGuestFormField(index),
          ),
        ),
      ),
    ],
  );
}

Widget buildGuestFormField(int index) {
  final CheckoutController checkoutController = Get.find();
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: buildTextFormField('Guest ${index + 1} Name',
                checkoutController.guests[index].nameController),
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              checkoutController.guests.removeAt(index);
            },
          ),
        ],
      ),
      buildTextFormField('Guest ${index + 1} Age',
          checkoutController.guests[index].ageController),
      SizedBox(height: 8),
    ],
  );
}
