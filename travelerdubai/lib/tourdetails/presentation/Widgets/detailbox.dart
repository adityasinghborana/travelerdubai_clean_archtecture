import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black,
          width: 1.0,
        )),
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
