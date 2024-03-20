import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/account_widget.dart';

import '../controller/headercontroller.dart';
import 'dashboard_widget.dart';

class Header extends StatelessWidget {
  final HeaderController headerController = Get.find();

  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 90,
        width: Get.width,
        color: headerController.isHeaderTransparent.value
            ? Colors.transparent
            : Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "./assets/logo.png",
                    height: 80,
                    width: 160,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: Get.width * 0.10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem("Home", '/home'),
                      _navItem("About Us", '/Aboutus'),
                      _navItem("Experiences", '/experiences'),
                      _navItem("Events", '/events'),
                      _navItem("Contact Us", '/contactus'),
                      // const SizedBox(
                      //   width: 200,
                      // ),
                      GetBuilder<HeaderController>(
                        builder: (controller) {
                          if (controller.loggedIn.isFalse) {
                            return LoginSignupWidget(); // Widget 1
                          } else {
                            return AccountWidget(); // Widget 2
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, String route) {
    headerController.isHoveredMap.putIfAbsent(title, () => false);

    return MouseRegion(
      onEnter: (_) {
        headerController.onHover(title, true);
      },
      onExit: (_) {
        headerController.onHover(title, false);
      },
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () => Get.toNamed(route),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              color: headerController.isHoveredMap[title] ?? false
                  ? colorPrimary
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
