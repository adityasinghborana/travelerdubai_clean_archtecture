import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class DetailBox extends StatelessWidget {
  final String title;
  final Widget description;
  final bool isExpanded;
  final TextStyle? textStyle;

  const DetailBox(
      {super.key,
      required this.title,
      required this.description,
      this.isExpanded = false,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: null,
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
        top: BorderSide(color: Color(0xFFCEDADF)),
            bottom:  BorderSide(color: Color(0xFFCEDADF)),),),

        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none, // Remove the border
          ),
          initiallyExpanded: isExpanded,
          childrenPadding: const EdgeInsets.all(20),
          title: Text(
            title,
            style: textStyle,
          ),
          children: [description],
        ),
      ),
    );
  }
}
