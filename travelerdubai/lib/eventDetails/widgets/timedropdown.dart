import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class TimeDropDown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;

  TimeDropDown({required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1,color: colorlightgrey.withOpacity(0.5))),
      constraints: BoxConstraints(minWidth: 200),
      
      child: DropdownButton<String>(
        underline:Container(),
        items: items,
        onChanged: onChanged,
        hint: Text('Select Time Slot'),
      ),
    );
  }
}