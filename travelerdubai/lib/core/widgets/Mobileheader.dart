

import 'package:flutter/material.dart';


class MobileHeader extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Image.asset(
            "./assets/logo.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}



