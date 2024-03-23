import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/AboutPage/datalayer/repository/aboutus_repositiory.dart';
import 'package:travelerdubai/AboutPage/datalayer/service/Aboutus_remote.dart';
import 'package:travelerdubai/AboutPage/datalayer/usecase/Aboutus_usecase.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/AboutPage/presentationlayer/about_us_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';
import 'package:travelerdubai/core/widgets/header.dart';

class AboutUsPage extends StatelessWidget {
  final AboutUsController controller = Get.put(
    AboutUsController(
      aboutUsUseCase: AboutUsUseCase(
        AboutPageImpl(
          AboutUsRemoteService(Dio()),
        ),
      ),
    ),
  );

  AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final aboutData = controller.aboutData.value;
        if (aboutData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              bannerWithOverlayText(
                  context, aboutData.imagepath, aboutData.title),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: twoColumnSection(
                  context,
                  aboutData.imagepath2,
                  aboutData.heading1,
                  aboutData.subheading1,
                  aboutData.detail1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: twoColumnSection(
                  context,
                  aboutData.imagepath3,
                  aboutData.heading2,
                  aboutData.subheading2,
                  aboutData.detail2,
                  invert: true,
                ),
              ),

            ],
          ),
        );
      }),
    );
  }

  Widget bannerWithOverlayText(
      BuildContext context, String imageUrl, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 32, color: colorwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget twoColumnSection(BuildContext context, String imageUrl, String heading,
      String subheading, String description,
      {bool invert = false}) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Row(
        children: invert
            ? [
                textColumn(heading, subheading, description),
                imageColumn(imageUrl),
              ]
            : [
                imageColumn(imageUrl),
                textColumn(heading, subheading, description),
              ],
      ),
    );
  }

  Widget imageColumn(String imageUrl) {
    return Expanded(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        scale: 1,
      ),
    );
  }

  Widget textColumn(String heading, String subheading, String description) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(heading,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 50,
            ),
            Text(subheading,
                style: const TextStyle(
                    fontSize: 28,
                    color: colorgreydark,
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget bannerWithButton(
      BuildContext context, String imageUrl, String buttonText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: InlineFlexButton(
          label: buttonText,
          onPressed: () {},
        ),
      ),
    );
  }
}
