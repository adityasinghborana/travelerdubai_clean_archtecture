import 'package:flutter/material.dart';

class IconTextBackground extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle textStyle;

  const IconTextBackground({
    Key? key,
    required this.iconData,
    required this.text,
    required this.backgroundColor,
    required this.iconColor,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // Wrap the Icon with a Container for background
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: backgroundColor, // Background color for the icon
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                    4.0) // Circle shape for the icon background
                ),
            child: Icon(
              iconData,
              color: iconColor,
              size: MediaQuery.of(context).size.shortestSide < 600 ? 12 : 36,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
