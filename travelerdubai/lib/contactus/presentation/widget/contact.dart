import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContactHeader(),
        _buildContactDetails(),
      ],
    );
  }

  Widget _buildContactHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        Text(
          'get in touch',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
        ),
        Text(
          'We are at your disposal 7 days a week!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContactItem("", "Store Location",
            "2972 Westheimer Rd.\nSanta Ana, Illinois\n85486"),
        _buildContactItem(
            "", "Phone Number", "(229) 555-0109\n(229) 555-2872"),
        _buildContactItem("", "Email us", "contact@example.com"),
        // ... Add other items similarly
      ],
    );
  }

  Widget _buildContactItem(String icon, String title, String details) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 40)),
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        Text(details, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
