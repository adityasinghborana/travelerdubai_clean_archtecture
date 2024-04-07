import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      leading:
          IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back_ios)),
      automaticallyImplyLeading: true,
      backgroundColor: colorwhite,
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                Image.asset(
                  "./assets/logo.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: height * .05,
                ),
                Flexible(flex: 3, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
