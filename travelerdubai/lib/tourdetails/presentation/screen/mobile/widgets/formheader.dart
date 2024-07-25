import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String heading;

  FormHeader({required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading, // Dynamic heading
        style: const TextStyle(
          color: Color(0xFF828282),
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }
}
