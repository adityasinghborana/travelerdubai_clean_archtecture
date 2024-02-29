import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final int selectedValue;
  final void Function(int?) onChanged;

  DropdownWidget({
    required this.label,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<int>(
          value: selectedValue,
          onChanged: onChanged,
          items: [0,1, 2, 3, 4,5,6] // Replace with your actual items
              .map<DropdownMenuItem<int>>(
                (int value) => DropdownMenuItem<int>(
              value: value,
              child: Text("$value"),
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}