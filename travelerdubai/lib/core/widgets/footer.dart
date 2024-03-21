import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';

Widget buildFooter() {
  return Container(
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          color: colorDarkBlue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05 * Get.width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLogoAndDescription(),
                _buildNavigationSections(),
                _buildPolicySections(),

                _buildNewsletterSection(),
              ],
            ),
          ),
        ),
        _buildCopyrightAndPaymentMethods(),
      ],
    ),
  );
}

Widget _buildLogoAndDescription() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "./assets/logo.png",
          width: 200,
          height: 40,
        ),
        const SizedBox(height: 16),
        const Text(
          "WE ACCEPT",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
        ),
        Image.asset(
          "./assets/cardimage.png",
          width: 200,
          height: 40,
        ),
      ],
    ),
  );
}


Widget _buildNavigationSections() {
  return  Flexible(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextButton(
          onPressed: () {
            // Handle Home button press
          },
          child: Text(
            "Home",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle About Us button press
          },
          child: Text(
            "About Us",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // Handle Experiences button press
          },
          child: Text(
            "Experiences",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle Tour List button press
          },
          child: Text(
            "Tour List",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle Event List button press
          },
          child: Text(
            "Event List",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle Contact Us button press
          },
          child: Text(
            "Contact Us",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPolicySections() {
  return  Flexible(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextButton(
          onPressed: () {
            // Handle Home button press
          },
          child: Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle About Us button press
          },
          child: Text(
            "Terms & Condition",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // Handle Experiences button press
          },
          child: Text(
            "Refund Policy ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),
        TextButton(
          onPressed: () {
            // Handle Tour List button press
          },
          child: Text(
            "Cancelation Policy",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),
        ),
        SizedBox(height: 4),

      ],
    ),
  );
}

Widget _buildNewsletterSection() {
  return  Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         Icon(FontAwesomeIcons.facebookF,color: colorTextgrey,),
         Icon(FontAwesomeIcons.instagram,color: colorTextgrey),
         Icon(FontAwesomeIcons.x,color: colorTextgrey),
         Icon(FontAwesomeIcons.youtube,color: colorTextgrey),
          ],
        ),
        SizedBox(height: 8),
       Align(
         alignment: Alignment.centerLeft,
         child: const Text(
            "Partner Signup/Login",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: colorTextgrey),

            overflow: TextOverflow.ellipsis,
          ),
       ),
        SizedBox(height: 10),
  TextButton(
  onPressed: () {
  // Handle Contact Us button press
  },
  child: Text(
  "Partner Login",
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
  ),),
        TextButton(
          onPressed: () {
            // Handle Contact Us button press
          },
          child: Text(
            "Partner SignUp",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey),
          ),)

      ],
    ),
  );
}

Widget _buildCopyrightAndPaymentMethods() {
  return  Container(
    color: colorDarkBlue,
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child:Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("© 2024 Travelerdubai All Rights Reserved.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: colorTextgrey)),

            ],
          ),
      ),
    );

}
