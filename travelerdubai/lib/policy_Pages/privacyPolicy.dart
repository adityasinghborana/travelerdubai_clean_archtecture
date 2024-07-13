import 'package:flutter/material.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../tourdetails/presentation/Widgets/detailbox.dart';
import '../tourdetails/presentation/Widgets/html.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Header(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80 ,vertical: 40),
          child: SingleChildScrollView(
            child: DetailBox(
              isExpanded: true,
              title: "PrivacyPolicy",
              description: HtmlDisplayWidget(
                  htmlContent:
                  "Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy Privacy POlicy "),
              textStyle: H1open(context).copyWith(color: colorDarkBlue),
            ),
          ),
        ),

      ]),
    );
  }
}
