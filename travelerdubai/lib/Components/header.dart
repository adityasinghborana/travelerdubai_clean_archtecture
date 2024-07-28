import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import '../auth/presentation/logout.dart';
import '../core/controller/headercontroller.dart';
import 'custom_button.dart';


class Header extends StatelessWidget {
  final HeaderController headerController = Get.find();
  final Logout logout = Logout();

  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .005,
                vertical: MediaQuery.of(context).size.height * .001),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(context),
                SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                Obx(() => headerController.loggedIn.isTrue
                    ? _buildMenuLoggedIn()
                    : _buildMenu()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/home');
      },
      child: Image.asset(
        images.logo,
        height: 80,
        width: MediaQuery.of(context).size.width * .1,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _navItem("Home", '/home', null),
        _navItem("About Us", '/Aboutus', null),
        _navItem("Events", '/events', null),
        _navItem("Experiences", '/experiences', null),
        _navItem("Contact Us", '/contactus', null),
        SizedBox(width: 50),
        _buildSignInButton(),
      ],
    );
  }

  Widget _buildMenuLoggedIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _navItem("Home", '/home', null),
        _navItem("About Us", '/Aboutus', null),
        _navItem("Events", '/events', null),
        _navItem("Contact Us", '/contactus', null),
        _navItem("Experiences", '/experiences', null),
        _navItem("Dashboard", '/dashboardpage', Icons.account_circle),
        _buildLogoutButton(),
      ],
    );
  }

  Widget _navItem(String title, String route, IconData? icon) {
    return _NavItemWidget(
      title: title,
      route: route,
      icon: icon,
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 12),
      child: ButtonView(
        btnName: 'Sign In',
        bgColor: colorblue,
        borderColor: Colors.transparent,
        onButtonTap: () {
          Get.toNamed("/login");
        },
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 12),
      child: ButtonView(
        btnName: 'Logout',
        bgColor: colorblue,
        borderColor: Colors.transparent,
        onButtonTap: () {
          headerController.loggedIn.value = false;
          logout.logout();
          Get.toNamed("/home");
        },
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  final String title;
  final String route;
  final IconData? icon;
  final HeaderController headerController = Get.find();

  _NavItemWidget({
    required this.title,
    required this.route,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = Get.currentRoute == route;
    bool isHovered = headerController.isHoveredMap[title] ?? false;

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

          if (Get.currentRoute.contains("/tour_details")) {

            Get.offNamed(route); // Replace the current route
          } else {
            print("pushnamed ");
            Get.toNamed( route); // Push a new route
          }
        },
        child: icon == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: isActive
                        ? colorblue
                        : (isHovered
                            ? colorblue
                            : headerController.navItemColor.value),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  icon,
                  color: isActive
                      ? colorblue
                      : (isHovered
                          ? colorblue
                          : headerController.navItemColor.value),
                ),
              ),
      ),
    );
  }
}
