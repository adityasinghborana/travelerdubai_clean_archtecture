import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class DropdownTransferWidget extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final List<String>? items;

  const DropdownTransferWidget({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    var item = items == null || items!.isEmpty
        ? <String>[
            'Without Transfers',
            'Transfer option 1',
            'Transfer option 2',
            // Add more items as needed
          ]
        : items;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: colorlightgrey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        icon: const Icon(Icons.arrow_drop_down_circle_rounded),
        underline: Container(),
        borderRadius: BorderRadius.circular(10),
        value: selectedValue ?? item?[0],
        onChanged: onChanged,
        items: item
            ?.map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    style: const TextStyle(color: colorlightgrey),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
