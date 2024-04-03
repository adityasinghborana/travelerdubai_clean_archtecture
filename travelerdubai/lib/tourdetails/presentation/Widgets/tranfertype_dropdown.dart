import 'package:flutter/material.dart';

class DropdownTransferWidget extends StatelessWidget {
  final String label;
  final String selectedValue;
  final void Function(String?) onChanged;

  DropdownTransferWidget({
    required this.label,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(label),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            items: <String>[
              'Without transfer',
              'Transfer option 1',
              'Transfer option 2',
              // Add more items as needed
            ].map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value),
                ),
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}
