import 'package:flutter/material.dart';

Widget passwordTextField(double height,TextEditingController controller, String label,
    bool obscureText, Function(bool) onVisibilityChanged,  ) {
  return Stack(
    children: [
      SizedBox(
        height: height, // Adjust the height of the TextField
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextField(
            controller: controller,
            obscureText:
                obscureText, // Toggle visibility based on the obscureText parameter
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  top: 20, left: 20), // Adjust top padding as needed
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Add suffixIcon for the visibility toggle button
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  // Toggle visibility and notify the parent
                  onVisibilityChanged(!obscureText);
                },
              ),
            ),
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
