import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/Mobileheader.dart';
import 'dart:html' as html;
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/contactus/datalayer/repository/repositoty.dart';
import 'package:travelerdubai/contactus/datalayer/services/remoteservice.dart';
import 'package:travelerdubai/contactus/datalayer/usecase/usecase.dart';
import 'package:travelerdubai/contactus/presentation/contactus_controller.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';

import '../../Components/Textformfield.dart';
import '../../Components/floatingaction_button.dart';
import '../../core/constants/constants.dart';
import '../datalayer/usecase/postform_usecase.dart';

class ContactusDesktop extends StatelessWidget {
  final HeaderController headerController = Get.find();
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

  ContactusDesktop({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: Container(
          width: Get.width ,
          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: FloatingActionButton(
                  isExtended: true,
                  backgroundColor: colorwhite,
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    html.window.open('https://wa.me/${controller.contactusdata.value?.mobilenumber}', 'new tab');
                  },
                ),
              ),
              FloatingCartButton(),

            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            var data = controller.contactusdata.value;
            return Column(
              children: [
                Get.width>1000 ?Header():MobileHeader(context: context),
                bannerWithOverlayText(context, images.bannerimage,
                    controller.contactusdata.value?.Heading ?? "no data", controller.contactusdata.value?.Subheading ?? "no data"),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 80.0, horizontal: 160),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  controller.contactusdata.value?.Heading2 ?? "no data",
                                  style: H1open(context).copyWith(
                                      color: colorDarkBlue,
                                      fontWeight: FontWeight.w900,
                                      fontSize: Get.width>600 ? 48 :24),
                                ),
                              ),
                              Container(
                                child: Text(controller.contactusdata.value?.Subheading2 ?? "no data"),
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
                                        child: Text(controller.contactusdata.value?.Address ?? "no data"),
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
                                        child: Text(controller.contactusdata.value?.Email ?? "no data"),
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
                                        child: Text(controller.contactusdata.value?.mobilenumber ?? "no data"),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        width: 100,
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildReplySection(
                                controller.nameController,
                                controller.emailController,
                                controller.mobileController,
                                controller.messageController)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ));
  }

  Widget _buildReplySection(TextEditingController name,
      TextEditingController email,
      TextEditingController mobile,
      TextEditingController message) {
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
                  fontSize: 72, color: colorwhite, fontWeight: FontWeight.bold),
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
