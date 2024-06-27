

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'package:travelerdubai/Components/drawer.dart';
import 'dart:html' as html;
import '../../Components/Textformfield.dart';
import '../../Components/custom_button.dart';
import '../../core/constants/constants.dart';
import '../datalayer/repository/repositoty.dart';
import '../datalayer/services/remoteservice.dart';
import '../datalayer/usecase/postform_usecase.dart';
import '../datalayer/usecase/usecase.dart';

import 'contactus_controller.dart';

class ContactUsMobile extends StatelessWidget {
  final ContactUsController controller = Get.put(
    ContactUsController(
      getContactUsDataUseCase: GetContactUsDataUseCase(
        ContactUsRepositoryImpl(
          ContactusRemote(Dio()),
        ),
      ),
      postFormUsecase: PostFormUseCase(
        ContactUsRepositoryImpl(
          ContactusRemote(Dio()),
        ),
      ),
    ),
  );

  ContactUsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileHeader(context: context,isBackButton: false,),
      drawer: drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorwhite,
        child: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.green,
        ),
        onPressed: () {
          html.window.open('https://wa.me/${controller.contactusdata.value?.mobilenumber}', 'new tab');
        },
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          bannerWithOverlayText(context, images.bannerimage,
              controller.contactusdata.value?.Heading ?? "",
              controller.contactusdata.value?.Subheading ?? ""),


          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    controller.contactusdata.value?.Heading2 ?? "",
                    style: H1open(context).copyWith(
                        color: colorDarkBlue,
                        fontWeight: FontWeight.w900,
                        fontSize: Get.width>600 ? 48 :24),
                  ),
                ),
                Container(
                  child: Text(controller.contactusdata.value?.Subheading2 ?? ""),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.pin_drop_rounded,
                          color: colorMediumBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(controller.contactusdata.value?.Address ?? ""),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mail,
                          color: colorMediumBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(controller.contactusdata.value?.Email ?? ""),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.whatsapp,
                          color: colorMediumBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(controller.contactusdata.value?.mobilenumber ?? ""),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildReplySection(
                controller.nameController,
                controller.emailController,
                controller.mobileController,
                controller.messageController),
          )
        ],
      ),
    ),);
  }
}

Widget bannerWithOverlayText(BuildContext context, String imageUrl, String text,
    String subheading) {
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
                  fontSize: 56, color: colorwhite, fontWeight: FontWeight.bold),
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

Widget _buildReplySection(TextEditingController name,
    TextEditingController email,
    TextEditingController mobile,
    TextEditingController message) {
  final ContactUsController controller = Get.put(
    ContactUsController(
      getContactUsDataUseCase: GetContactUsDataUseCase(
        ContactUsRepositoryImpl(
          ContactusRemote(Dio()),
        ),
      ),
      postFormUsecase: PostFormUseCase(
        ContactUsRepositoryImpl(
          ContactusRemote(Dio()),
        ),
      ),
    ),
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 10),
      buildTextFormField("Name", name, "fill the hint", () => null),
      buildTextFormField("Email", email, "fill the hint", () => null),
      buildTextFormField(
          "Mobile Number", mobile, "with country code", () => null),
      buildTextFormField("Message", message, "fill the hint", () => null),
      SizedBox(
        height: 30,
      ),
      SizedBox(
          width: 400,
          child: ButtonView(
            btnName: "Submit",
            borderColor: Colors.transparent,
            bgColor: colorMediumBlue,
            onButtonTap: () {
              controller.postForm();
            },
          ))
    ],
  );
}

