import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/widgets/drawer.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton ;

  const MobileHeader({super.key ,  this.isBackButton =true} );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: isBackButton,
      leading:
      isBackButton
          ? IconButton(
        onPressed: Get.back,
        icon:  Icon(Icons.arrow_back),
      )
          :IconButton(
        onPressed:()=> Scaffold.of(context).openDrawer(),
        icon:  Icon(Icons.menu),
      ) ,

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
