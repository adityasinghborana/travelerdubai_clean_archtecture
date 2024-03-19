import 'package:flutter/material.dart';

Widget textOnLine(String text) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 1, // Height of the line
        width: double.infinity, // Full width
        color: Colors.black, // Color of the line
      ),
      Container(
        color: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
