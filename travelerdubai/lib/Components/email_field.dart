import 'package:flutter/material.dart';

Widget emailField(
    TextEditingController controller, String label, String? hint) {
  return Stack(
    children: [
      SizedBox(
        height: 60, // Adjust the height of the TextField
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 20, left: 20), // Adjust top padding as needed
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: hint),
          ),
        ),
      ),
      Positioned(
        left: 10, // Adjust left positioning as needed
        top: 0,

        // Position label above the top border
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          color: Colors.white, // Adjust background color as needed
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black, // Adjust label color as needed
            ),
          ),
        ),
      ),
    ],
  );
}
