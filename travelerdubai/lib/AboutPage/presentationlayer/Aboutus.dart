import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/AboutPage/datalayer/repository/aboutus_repositiory.dart';
import 'package:travelerdubai/AboutPage/datalayer/service/Aboutus_remote.dart';
import 'package:travelerdubai/AboutPage/datalayer/usecase/Aboutus_usecase.dart';
import 'package:travelerdubai/AboutPage/presentationlayer/about_us_controller.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/Components/footer.dart';
import 'package:travelerdubai/Components/header.dart';
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
          return Column(
            children: [
              Get.width > 1024
                  ? Header()
                  : MobileHeader(
                context: context,
                isBackButton: true,
              ),
              Expanded(child: const Center(child: Text("No Data Present In Backend"))),
            ],
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Get.width > 1024
                  ? Header()
                  : MobileHeader(
                      context: context,
                      isBackButton: true,
                    ),
              bannerWithOverlayText(context, aboutData.imagepath,
                  aboutData.title, aboutData.subtitle),
              Padding(
                padding: Get.width > 600
                    ? EdgeInsets.all(80.0)
                    : EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Get.width > 600
                            ? twoColumnSection(context, aboutData.imagepath2,
                                aboutData.heading1, aboutData.detail1)
                            : SingleColumn(context, aboutData.imagepath,
                                aboutData.heading1, aboutData.detail1)),
                    Get.width > 600
                        ? SizedBox(
                            height: Get.height * 0.065,
                          )
                        : SizedBox(),
                    Get.width < 600
                        ? Container()
                        : Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                    Get.width > 600
                        ? SizedBox(
                            height: Get.height * 0.065,
                          )
                        : SizedBox(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Get.width > 600
                            ? twoColumnSection(
                                context,
                                aboutData.imagepath3,
                                aboutData.heading2,
                                aboutData.detail2,
                                invert: true,
                              )
                            : SingleColumn(context, aboutData.imagepath3,
                                aboutData.heading2, aboutData.detail2)),
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
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: MediaQuery.of(Get.context!).size.width > 600
              ? MediaQuery.of(Get.context!).size.width * 0.4
              : MediaQuery.of(Get.context!).size.width * 0.8,
          height: MediaQuery.of(Get.context!).size.height * 0.4,
          fit: BoxFit.cover,
          scale: 1,
        ),
      ),
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
          Flexible(
              child: Text(description, style: const TextStyle(fontSize: 18))),
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

  Widget SingleColumn(BuildContext context, String imageUrl, String heading,
      String description) {
    return Column(
      children: [
        SizedBox(
          width: 380,
          height: 150,
          child: Row(
            children: [
              imageColumn(imageUrl),
            ],
          ),
        ),
        Container(
          height: 400,
          width: 380,
          child: Row(
            children: [
              textColumn(heading, description),
            ],
          ),
        ),
      ],
    );
  }
}
