import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/constants/contants.dart';

Widget buildFooterMobile() {
  return ResponsiveBuilder(builder: (context, sizingInformation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          color: colorDarkBlue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.025 * Get.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogoAndDescription(context),
                _buildNavigationSections(),
                _buildPolicySections(),
                _buildNewsletterSection(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ],
            ),
          ),
        ),
        _buildCopyrightAndPaymentMethods(),
      ],
    );
  });
}

Widget _buildLogoAndDescription(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        "./assets/logo.png",
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.width * 0.20,
      ),
      const SizedBox(height: 8),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "WE ACCEPT",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/discover.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/formkit_visa.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/formkit_gpay.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/amex.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/mastercard.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/paypal.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "../assets/visa.png",
              width: Get.width * .10,
              height: Get.width * .10,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildNavigationSections() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () {
          // Handle Home button press
        },
        child: const Text(
          "Home",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle Experiences button press
        },
        child: const Text(
          "Experiences",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 8),
      TextButton(
        onPressed: () {
          // Handle About Us button press
        },
        child: const Text(
          "About Us",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle Tour List button press
        },
        child: const Text(
          "Tour List",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle Event List button press
        },
        child: const Text(
          "Event List",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle Contact Us button press
        },
        child: const Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
    ],
  );
}

Widget _buildPolicySections() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () {
          // Handle Home button press
        },
        child: const Text(
          "Privacy Policy",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle About Us button press
        },
        child: const Text(
          "Terms & Condition",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 8),
      TextButton(
        onPressed: () {
          // Handle Experiences button press
        },
        child: const Text(
          "Refund Policy ",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
      TextButton(
        onPressed: () {
          // Handle Tour List button press
        },
        child: const Text(
          "Cancelation Policy",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      const SizedBox(height: 4),
    ],
  );
}

Widget _buildNewsletterSection() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.facebookF,
            color: colorTextgrey,
          ),
          Icon(FontAwesomeIcons.instagram, color: colorTextgrey),
          Icon(FontAwesomeIcons.x, color: colorTextgrey),
          Icon(FontAwesomeIcons.youtube, color: colorTextgrey),
        ],
      ),
      const SizedBox(height: 8),
      const Align(
        alignment: Alignment.center,
        child: Text(
          "Partner Signup/Login",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      const SizedBox(height: 10),
      TextButton(
        onPressed: () {
          // Handle Contact Us button press
        },
        child: const Text(
          "Partner Login",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      ),
      TextButton(
        onPressed: () {
          // Handle Contact Us button press
        },
        child: const Text(
          "Partner SignUp",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),
        ),
      )
    ],
  );
}

Widget _buildCopyrightAndPaymentMethods() {
  return Container(
    color: colorDarkBlue,
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("© 2024 Travelerdubai All Rights Reserved.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: colorTextgrey)),
        ],
      ),
    ),
  );
}
