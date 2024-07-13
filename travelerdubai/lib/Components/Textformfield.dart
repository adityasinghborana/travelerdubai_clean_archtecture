import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

Widget buildTextFormField(String label, TextEditingController controller,
    String errorMessage, void Function()? onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        fillColor: colorwhite,
        filled: true,
        labelText: label,
        border: const OutlineInputBorder()
            .copyWith(borderRadius: BorderRadius.circular(10)),
      ),
      onTap: onTap,
    ),
  );
}
