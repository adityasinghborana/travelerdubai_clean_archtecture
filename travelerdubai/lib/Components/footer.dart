import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import 'footer_mobile.dart';

Widget buildFooter() {
  return ResponsiveBuilder(builder: (context, sizingInformation) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop ||
        sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            color: colorDarkBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.025 * Get.width),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildLogoAndDescription(),
                      _buildNavigationSections(),
                      _buildPolicySections(),
                      _buildNewsletterSection(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          _buildCopyrightAndPaymentMethods(),
        ],
      );
    }

    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return buildFooterMobile();
    } else {
      return const Text("others");
    }
  });
}

Widget _buildLogoAndDescription() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
         images.logo,
          width: Get.width * .15,
          height: Get.width * .025,
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "WE ACCEPT",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        Row(
          children: [
           Image.asset(images.paymentsimage)
          ],
        ),
      ],
    ),
  );
}

Widget _buildNavigationSections() {
  return Flexible(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(


          onPressed: () {
            // Handle Home button press
            Get.toNamed('/home');
          },
          child: const Text(
            "Home",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle Experiences button press
            Get.toNamed('/experiences');
          },
          child: const Text(
            "Experiences",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // Handle About Us button press
            Get.toNamed('/Aboutus');
          },
          child: const Text(
            "About Us",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),

        const SizedBox(height: 4),
        TextButton(
          onPressed: () {
            Get.toNamed('/events');
          },
          child: const Text(
            "Event List",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () {
           Get.toNamed('/contactus');
          },
          child: const Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPolicySections() {
  return Flexible(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Get.toNamed('/privacypolicy');
          },
          child: const Text(
            "Privacy Policy",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () {
            Get.toNamed('/termsandcondition');
          },
          child: const Text(
            "Terms & Condition",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
       Get.toNamed('/refundpolicy');
          },
          child: const Text(
            "Refund Policy ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () {
            Get.toNamed('/cancelationpolicy');
          },
          child: const Text(
            "Cancelation Policy",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        const SizedBox(height: 4),
      ],
    ),
  );
}

Widget _buildNewsletterSection() {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          alignment: Alignment.centerLeft,
          child: Text(
            "Partner Signup/Login",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
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
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        ),
        TextButton(
          onPressed: () {
            // Handle Contact Us button press
          },
          child: const Text(
            "Partner SignUp",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorTextgrey),
          ),
        )
      ],
    ),
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
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colorTextgrey)),
        ],
      ),
    ),
  );
}
