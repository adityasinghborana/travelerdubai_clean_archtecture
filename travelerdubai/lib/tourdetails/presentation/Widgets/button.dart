// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class InlineFlexButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double vpadding;
  final double hpadding;
  final double fontsize;
  final Color bgcolor;

  const InlineFlexButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.vpadding = 30,
    this.hpadding = 40,
    this.fontsize = 20,
    this.bgcolor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        padding: EdgeInsets.symmetric(vertical: vpadding, horizontal: hpadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(color: Colors.white),
        alignment: Alignment.center,
      ),
      child: Text(
        label,
        style: GoogleFonts.roboto(fontSize: 16, color: colorwhite),
      ),
    );
  }
}
