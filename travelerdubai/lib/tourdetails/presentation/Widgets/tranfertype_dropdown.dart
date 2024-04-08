import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(border: Border.all(width: 1,color: colorlightgrey.withOpacity(0.5)),borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        icon: Icon(Icons.arrow_drop_down_circle_rounded),
        underline: Container(),
        borderRadius: BorderRadius.circular(10),
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
              child: Text(value,style: TextStyle(color: colorlightgrey),),
            ),
          ),
        ).toList(),
      ),
    );
  }
}