import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

Widget dateInputField(TextEditingController controller, BuildContext context,
    void Function() onClicked) {
  return Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 150,
            height: 50,
            decoration: const BoxDecoration(
              color: color_EEEEEE,
              border: Border(
                left: BorderSide(width: 2.0),
                top: BorderSide(width: 2.0),
                bottom: BorderSide(width: 2.0),
              ),
            ),
            child: TextField(
              controller: controller,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String month = pickedDate.month.toString().padLeft(2, '0');
                  String day = pickedDate.day.toString().padLeft(2, '0');
                  controller.text = "${pickedDate.year}-$month-$day";
                }
                onClicked();
              },
              decoration: const InputDecoration(
                labelText: 'Select Date',
                hintText: 'Select Date',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: const BoxDecoration(
            color: color_EEEEEE,
            border: Border(
              right: BorderSide(width: 2.0),
              top: BorderSide(width: 2.0),
              bottom: BorderSide(width: 2.0),
              left: BorderSide(width: 2.0),
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                String month = pickedDate.month.toString().padLeft(2, '0');
                String day = pickedDate.day.toString().padLeft(2, '0');
                controller.text = "${pickedDate.year}-$month-$day";
              }
              onClicked();
            },
          ),
        ),
      ],
    ),
  );
}
