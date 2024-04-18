import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/AboutPage/datalayer/repository/aboutus_repositiory.dart';
import 'package:travelerdubai/AboutPage/datalayer/service/Aboutus_remote.dart';
import 'package:travelerdubai/AboutPage/datalayer/usecase/Aboutus_usecase.dart';
import 'package:travelerdubai/AboutPage/presentationlayer/about_us_controller.dart';
import 'package:travelerdubai/core/widgets/footer.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../core/constants/constants.dart';

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
              bannerWithOverlayText(context, aboutData.imagepath,
                  aboutData.title, aboutData.subtitle),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: twoColumnSection(context, aboutData.imagepath2,
                          aboutData.heading1, aboutData.detail1),
                    ),
                    SizedBox(
                      height: Get.height * 0.062,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Container(
                              child: Text(
                                aboutData.text,
                                style: bodyBlack(context),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.062,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: twoColumnSection(
                        context,
                        aboutData.imagepath3,
                        aboutData.heading2,
                        aboutData.detail2,
                        invert: true,
                      ),
                    ),
                  ],
                ),
              ),
              bannerWithButton(context, aboutData.imagepath2, "Explore"),
              buildFooter()
            ],
          ),
        );
      }),
    );
  }

  Widget bannerWithOverlayText(
      BuildContext context, String imageUrl, String text, String subheading) {
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 72,
                    color: colorwhite,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subheading,
                style: const TextStyle(
                    fontSize: 16,
                    color: colorwhite,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget twoColumnSection(
      BuildContext context, String imageUrl, String heading, String description,
      {bool invert = false}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        children: invert
            ? [
                textColumn(heading, description),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                imageColumn(imageUrl),
              ]
            : [
                imageColumn(imageUrl),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                textColumn(heading, description),
              ],
      ),
    );
  }

  Widget imageColumn(
    String imageUrl,
  ) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              width: MediaQuery.of(Get.context!).size.width * 0.4,
              height: MediaQuery.of(Get.context!).size.height * 0.2,
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget textColumn(String heading, String description) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(heading,
              style:
                  const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          SizedBox(
            height: Get.height * 0.032,
          ),
          Text(description, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget bannerWithButton(
      BuildContext context, String imageUrl, String buttonText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: InlineFlexButton(
          vpadding: 20,
          hpadding: 50,
          bgcolor: colorblue,
          label: buttonText,
          onPressed: () {
            Get.toNamed("/experiences");
          },
        ),
      ),
    );
  }
}
