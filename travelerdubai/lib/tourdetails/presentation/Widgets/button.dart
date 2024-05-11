// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class InlineFlexButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double vpadding;
  final double hpadding;
  final double fontsize;
  final Color bgcolor;
  final Color textcolor;
  final double borderwidth;

  InlineFlexButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.vpadding = 30,
    this.hpadding = 40,
    this.fontsize = 20,
    this.bgcolor = Colors.transparent,
    this.textcolor = colorwhite,
    this.borderwidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: bgcolor,
        padding: EdgeInsets.symmetric(vertical: vpadding, horizontal: hpadding),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: borderwidth),
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: TextStyle(color: textcolor),
        alignment: Alignment.center,
      ),
      child: Text(
        label,
        style: GoogleFonts.roboto(fontSize: fontsize, color: textcolor),
      ),
    );
  }
}
