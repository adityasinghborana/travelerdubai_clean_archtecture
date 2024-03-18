import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../tourdetails/presentation/Widgets/button.dart';
import '../constants/contants.dart';

class LoginSignupWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        TextButton(
          onPressed: () => Get.toNamed('/Login'),
          child: Text(
            "Login",
            style: GoogleFonts.playfairDisplay(
                fontSize: 20, color: colorPrimary),
          ),
        ),
        const SizedBox(width: 20), // Spacing between buttons
        InlineFlexButton(
          fontsize: 20,
          hpadding: 25,
          vpadding: 18,
          onPressed: () => Get.toNamed('/Signup'),
          label: "Signup",
        ),
      ],
    );
  }
}
