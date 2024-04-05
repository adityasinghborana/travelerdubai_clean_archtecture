import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class DetailBox extends StatelessWidget {
  final String title;
  final Widget Description;
  final bool isExpanded;
  final TextStyle? textStyle;

  const DetailBox(
      {Key? key,
      required this.title,
      required this.Description,
      this.isExpanded = false,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: colorwhite,
      color: colorwhite,
      elevation: 3,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide.none, // Remove the border
        ),
        initiallyExpanded: isExpanded,
        childrenPadding: EdgeInsets.all(20),
        title: Text(
          title,
          style: textStyle,
        ),
        children: [Description],
      ),
    );
  }
}
