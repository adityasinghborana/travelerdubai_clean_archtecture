import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: colorwhite,
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Image.asset(
              "./assets/logo.png",
              width: MediaQuery.of(context).size.width * 0.4,
              height: height * .05,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
