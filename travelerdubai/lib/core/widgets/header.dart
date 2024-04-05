import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import '../controller/headercontroller.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "./assets/logo.png",
                    height: 80,
                    width: width * .1,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: width * 0.10,
                  ),
                  GetBuilder<HeaderController>(
                    builder: (headerController) {
                      var status = headerController.loggedIn.value;
                      if (status != null && status != false) {
                        return MenuLoggedin();
                      } else {
                        return Menu();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );

  }

  Widget _navItem(String title, String route) {
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
              Get.toNamed(route);
            },
            child: Padding(
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
            ),
          ));
    });
  }

  Widget Menu() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _navItem(
        "Home",
        '/home',
      ),
      _navItem(
        "About Us",
        '/Aboutus',
      ),
      _navItem(
        "Experiences",
        '/experiences',
      ),
      _navItem(
        "Events",
        '/events',
      ),
      _navItem(
        "Contact Us",
        '/contactus',
      ),
      _navItem(
        "Login",
        '/Login',
      ),
      _navItem(
        "SignUp",
        '/Signup',
      ),
    ]);
  }

  Widget MenuLoggedin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _navItem(
          "Home",
          '/home',
        ),
        _navItem(
          "About Us",
          '/Aboutus',
        ),
        _navItem(
          "Experiences",
          '/experiences',
        ),
        _navItem(
          "Events",
          '/events',
        ),
        _navItem(
          "Contact Us",
          '/contactus',
        ),
        _navItem(
          "Cart",
          '/Login',
        ),
        _navItem(
          "Dashboard",
          '/Signup',
        ),
      ],
    );
  }
}
