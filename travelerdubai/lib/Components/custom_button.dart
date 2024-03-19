import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base_text.dart';

@immutable
class ButtonView extends StatelessWidget {
  final String btnName;
  final VoidCallback? onButtonTap;
  final Color? borderColor;
  final Color? bgColor;
  final Color? txtColor;
  final double? radius;
  final IconData? iconData; // New parameter for the icon
  const ButtonView(
      {Key? key, // Added 'Key? key'
      required this.btnName,
      this.onButtonTap,
      this.borderColor,
      this.bgColor,
      this.txtColor,
      this.radius = 10,
      this.iconData}); // Added 'this.iconData'

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onButtonTap != null) {
          onButtonTap!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.green, width: 1),
          color: bgColor ?? Colors.green,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Row(
          // Changed from Column to Row
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (iconData != null) // Render icon only if iconData is provided
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Adjust padding as needed
                child: Icon(iconData, color: txtColor ?? Colors.white),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
              child: BaseText(
                text: btnName,
                textColor: txtColor ?? Colors.white,
                style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: txtColor ?? Colors.white),
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
