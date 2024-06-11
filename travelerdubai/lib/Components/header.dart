import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../core/controller/headercontroller.dart';
import 'custom_button.dart';

class Header extends StatelessWidget {
  final HeaderController headerController = Get.put(HeaderController());

  Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: 60,
      width: width,
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .005, vertical: height * .001),
            child: Padding(
              padding:  EdgeInsets.only(right: Get.width*0.03,left:Get.width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('/home');
                    },
                    child: Image.asset(
                      "../assets/images/logo.png",
                      height: 80,
                      width: width * .1,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.10,
                  ),
                  GetBuilder<HeaderController>(
                    builder: (headerController) {
                      var status = headerController.loggedIn.value;
                      if (status != false) {
                        return menuLoggedIn();
                      } else {
                        return menu();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, String route, IconData? icon) {
    headerController.isHoveredMap.putIfAbsent(title, () => false);

    return Obx(() {
      return MouseRegion(
          onEnter: (_) {
            headerController.onHover(title, true);
          },
          onExit: (_) {
            headerController.onHover(title, false);
          },
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              headerController.navItemColor.value = colorblack;
              Get.offAndToNamed(route);
            },
            child: icon == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        color: headerController.isHoveredMap[title] ?? false
                            ? colorblue
                            : headerController.navItemColor.value,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      icon,
                      color: headerController.isHoveredMap[title] ?? false
                          ? colorblue
                          : headerController.navItemColor.value,
                    ),
                  ),
          ));
    });
  }

  Widget menu() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _navItem(
        "Home",
        '/home',
        null,
      ),
      _navItem(
        "About Us",
        '/Aboutus',
        null,
      ),
      _navItem(
        "Experiences",
        '/experiences',
        null,
      ),
      _navItem(
        "Contact Us",
        '/contactus',
        null,
      ),
      // _navItem(
      //   "Contact Us",
      //   '/contactus',
      // ),
SizedBox(width: 50,),
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: ButtonView(btnName: 'Sign In',bgColor: colorblue,borderColor: Colors.transparent,onButtonTap: (){
          Get.toNamed("/login");
        },),
      )

    ]);
  }

  Widget menuLoggedIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _navItem(
          "Home",
          '/home',
          null,
        ),
        _navItem(
          "About Us",
          '/Aboutus',
          null,
        ),
        _navItem("Experiences", '/experiences', null),
        // _navItem(
        //   "Contact Us",
        //   '/contactus',
        // ),
        _navItem(
          "Cart",
          '/checkout',
          Icons.shopping_cart,
        ),
        _navItem(
          "Dashboard",
          '/dashboardpage',
          Icons.account_circle,
        ),
      ],
    );
  }
}
