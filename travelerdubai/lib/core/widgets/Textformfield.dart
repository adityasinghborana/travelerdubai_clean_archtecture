import 'package:flutter/material.dart';

Widget buildTextFormField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
