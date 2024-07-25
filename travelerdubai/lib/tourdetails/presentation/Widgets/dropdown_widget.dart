import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final int selectedValue;
  final void Function(int?) onChanged;

  const DropdownWidget({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: bodyBlack(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(border: Border.all(width: 1,color: colorlightgrey.withOpacity(0.5)),borderRadius: BorderRadius.circular(12)),
            child: DropdownButton<int>(

              underline: Container(),
              borderRadius: BorderRadius.circular(10),
              value: selectedValue,
              onChanged: onChanged,
              items: [0, 1, 2, 3, 4, 5, 6] // Replace with your actual items
                  .map<DropdownMenuItem<int>>(
                    (int value) => DropdownMenuItem<int>(
                      alignment: Alignment.centerLeft,
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 80.0),
                        child: Text("$value", style: bodyBlack(context)),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
