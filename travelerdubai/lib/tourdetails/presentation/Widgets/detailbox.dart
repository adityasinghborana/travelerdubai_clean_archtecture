import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class DetailBox extends StatelessWidget {
  final String title;
  final Widget Description;
  final bool isExpanded;
  final TextStyle? textStyle;

  const DetailBox(
      {super.key,
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
        shape: const RoundedRectangleBorder(
          side: BorderSide.none, // Remove the border
        ),
        initiallyExpanded: isExpanded,
        childrenPadding:const EdgeInsets.all(20),
        title: Text(
          title,
          style: textStyle,
        ),
        children: [Description],
      ),
    );
  }
}
