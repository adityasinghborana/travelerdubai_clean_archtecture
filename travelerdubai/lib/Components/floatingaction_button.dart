import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../core/controller/headercontroller.dart';

class FloatingCartButton extends StatelessWidget {
  final HeaderController headerController = Get.find();

  FloatingCartButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: _getCartLengthFromPrefs(),
      builder: (context, snapshot) {
        int? cartLength = snapshot.data;

        return Badge(
          label:  Text("${snapshot?.data ?? 0}"),

          child: FloatingActionButton(
            mini: Get.width > 600 ? false : true,
            isExtended: true,
            backgroundColor: Colors.white,
            child: Icon(
              FontAwesomeIcons.cartShopping,
              size: 18,
              color: colorMediumBlue,
            ),
            onPressed: () {
              Get.toNamed("/checkout");
            },
          ),
        );
      },
    );
  }

  Future<int?> _getCartLengthFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Cartlength');
  }
}
