import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class TimeDropDown extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;

  TimeDropDown({required this.items, required this.onChanged});

  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: colorlightgrey.withOpacity(0.5)),
      ),
      constraints: BoxConstraints(minWidth: 200),
      child: DropdownButton<String>(
        underline: Container(),
        items: widget.items,
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged(value);
        },
        value: _selectedValue,
        hint: Text('Select Time Slot'),
      ),
    );
  }
}
