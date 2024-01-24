import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}
@override

class _HeaderState extends State<Header> {
  final Map<String, bool> _isHoveredMap = {};

  void _onHover(String title, bool hover) {
    setState(() {
      _isHoveredMap[title] = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Image.asset(
                  "./assets/logo.png",
                  height: 80,
                  width: 160,
                  fit: BoxFit.contain,
                ),
                // Navigation Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navItem("Home", '/home'),
                    _navItem("About Us", '/Aboutus'),
                    _navItem("Experiences", '/experiences'),
                    _navItem("Events", '/events'),
                    _navItem("Contact Us", '/contactus'),
                    _navItem("rough", '/rough'),
                  ],
                ),
                // Authentication Buttons
                Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, String route) {
    _isHoveredMap.putIfAbsent(title, () => false);

    return MouseRegion(
      onEnter: (_) {
        _onHover(title, true);
      },
      onExit: (_) {
        _onHover(title, false);
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
              color:
                  _isHoveredMap[title] ?? false ? colorPrimary : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
