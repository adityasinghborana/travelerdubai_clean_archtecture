import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildFooter() {
  return Container(
    height: Get.height * 0.90,
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMembershipPromo(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05 * Get.width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLogoAndDescription(),
                _buildNavigationSections(),
                _buildContactInfo(),
                _buildNewsletterSection(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
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
          "There are many variations of passages of Lorem the Ipsum available but it is the majority of suffered that a alteration in that some dummy text.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget _buildMembershipPromo() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.network("https://source.unsplash.com/random/?bali",
          width: Get.width * .7, height: 361, fit: BoxFit.cover),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Become a Pro Travelerdubai Member?",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Sign In")),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () {}, child: const Text("Register")),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget _buildNavigationSections() {
  return const Flexible(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About Us",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Text("Home",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 4),
        Text("Experiences",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 4),
        Text("Tour List",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 4),
        Text("Event List",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 4),
        Text("Contact Us",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      ],
    ),
  );
}

Widget _buildContactInfo() {
  return const Flexible(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Contact Info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Text("455 West Orchard Street Kings Mountain, NC 280867",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 4),
        Row(
          children: [
            Text("",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(width: 8),
            Text("+088 (006) 992-99-10",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text("",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(width: 8),
            Text("example@gmail.com",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildNewsletterSection() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Newsletter",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text(
          "Passages of Lorem the Ipsum available but it is the majority of suffered that a alteration",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Enter your email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: const Text("Subscribe Now")),
      ],
    ),
  );
}

Widget _buildCopyrightAndPaymentMethods() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("© 2023 Travelerdubai All Rights Reserved.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          // Add a placeholder for payment methods icons or other widgets if you plan to include them
          Row(
            children: [
              Icon(Icons.credit_card,
                  size: 24), // Placeholder for a payment method icon
              SizedBox(width: 10),
              Icon(Icons.payment,
                  size: 24), // Another placeholder for a payment method icon
            ],
          ),
        ],
      ),
    ),
  );
}
