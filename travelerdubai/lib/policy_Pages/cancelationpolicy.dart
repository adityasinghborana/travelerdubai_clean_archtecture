import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../Components/Mobileheader.dart';
import '../Components/footer.dart';
import '../Components/footer_mobile.dart';
import '../tourdetails/presentation/Widgets/detailbox.dart';
import '../tourdetails/presentation/Widgets/html.dart';

class CancelationPolicy extends StatelessWidget {
  const CancelationPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Get.width>1000 ? Header() :MobileHeader(context: context,isBackButton: false,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80 ,vertical: 40),
          child: DetailBox(
            isExpanded: true,
            title: "Cancelation Policy",
            description: HtmlDisplayWidget(
                htmlContent:
                "Cancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation PolicyCancelation Policy "),
            textStyle: H1open(context).copyWith(color: colorDarkBlue),
          ),
        ),
        Get.width>1000 ?   buildFooter():buildFooterMobile()
      ]),
    );
  }
}
