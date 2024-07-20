import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

Widget dateInputField(TextEditingController controller, BuildContext context,
    void Function() onClicked, double? width) {
  return Container(
    width: width ?? 200,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: colorlightgrey.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: colorlightgrey),
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2024),
                lastDate: DateTime.now().add(const Duration(days: 3 * 30)),
              );
              if (pickedDate != null) {
                String month = pickedDate.month.toString().padLeft(2, '0');
                String day = pickedDate.day.toString().padLeft(2, '0');
                controller.text = "${pickedDate.year}-$month-$day";
              }
              onClicked();
            },
            decoration: const InputDecoration(
              hintText: 'Select Date',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: colorwhite,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          width: 60,
          height: 60,
          child: IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: colorlightgrey,
            ),
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
