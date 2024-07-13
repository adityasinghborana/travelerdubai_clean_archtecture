import 'package:flutter/material.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../tourdetails/presentation/Widgets/detailbox.dart';
import '../tourdetails/presentation/Widgets/html.dart';

class RefundPolicy extends StatelessWidget {
  const RefundPolicy({super.key});

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
              title: "Refund Policy",
              description: HtmlDisplayWidget(
                  htmlContent:
                  "Refund Policy Refund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund PolicyRefund Policy "),
              textStyle: H1open(context).copyWith(color: colorDarkBlue),
            ),
          ),
        ),

      ]),
    );
  }
}
